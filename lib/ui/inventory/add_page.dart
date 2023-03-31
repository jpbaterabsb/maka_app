import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:maka_tht/blocs/list_item_bloc.dart';
import 'package:maka_tht/models/item.dart';
import 'package:maka_tht/ui/shared/toast.dart';

class InventoryAddPage extends StatefulWidget {
  const InventoryAddPage({super.key});

  @override
  State<InventoryAddPage> createState() => _InventoryAddPageState();
}

class _InventoryAddPageState extends State<InventoryAddPage> {
  final _formKey = GlobalKey<FormState>();
  final listItemBloc = GetIt.instance.get<ListItemsBloc>();

  final _itemName = TextEditingController();
  final _quantity = TextEditingController();
  int? itemID;

  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      EasyLoading.show();
      var item = Item(
          itemID: itemID,
          itemName: _itemName.text,
          quantity: int.parse(_quantity.text));
      listItemBloc.saveAndFetch(item)
      .then((value) => EasyLoading.showSuccess('${_itemName.text} was added successfully'))
          .catchError((err) => EasyLoading.showError(err.response.data["message"] ?? "Internal Server Error"))
          .whenComplete(() {
        Navigator.pop(context);
        EasyLoading.dismiss();
      });
    }
  }

  void _clearForm() {
    _formKey.currentState!.reset();
  }

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)!.settings.arguments;
    if (arguments != null) {
      var map = arguments as Map<String, dynamic>;
      final item = map['item'];
      _itemName.text = item.itemName;
      _quantity.text = item.quantity.toString();
      itemID = item.itemID;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register an item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _itemName,
                decoration: const InputDecoration(
                  labelText: 'Item Name',
                ),
                maxLength: 50,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an item name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _itemName.text = value!;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _quantity,
                decoration: const InputDecoration(
                  labelText: 'Quantity',
                ),
                keyboardType: TextInputType.number,
                maxLength: 7,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a quantity';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _quantity.text = value!;
                },
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    color: Colors.white,
                    elevation: 2,
                    onPressed: _clearForm,
                    child: const Text('Clear'),
                  ),
                  MaterialButton(
                    color: Colors.red,
                    elevation: 2,
                    onPressed: () {
                      _submitForm(context);
                    },
                    child: const Text('Save'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
