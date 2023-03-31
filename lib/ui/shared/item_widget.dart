

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:maka_tht/blocs/show_bloc.dart';
import 'package:maka_tht/models/item.dart';

class ItemWidget extends StatelessWidget {
  final List<Item> items;
  final Function(Item) onTap;
  final bool buyMode;

  const ItemWidget(
      {Key? key,
      required this.items,
      required this.onTap,
      required this.buyMode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var showBloc = GetIt.instance.get<ShowBloc>();
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: buyMode ? () {}: () => onTap(items[index]),
          child: Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              items.removeAt(index);
            },
            background: Container(
              color: Colors.green,
              alignment: Alignment.centerLeft,
              child: const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Icon(Icons.check),
              ),
            ),
            secondaryBackground: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              child: const Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Icon(Icons.delete),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1.0,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 10.0,
                ),
                child: Row(
                  children: [
                    const Icon(Icons.shopping_cart),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            items[index].itemName,
                            style: const TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            'Quantity: ${items[index].quantity}',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: buyMode,
                      child: MaterialButton(
                        onPressed: () {
                          EasyLoading.show();
                          showBloc
                              .buyAndFetchItems(items[index].itemID!)
                              .then((_) => EasyLoading.showSuccess(
                                  "The item ${items[index].itemName} was sold successfully",
                                  duration: const Duration(seconds: 3),
                                  dismissOnTap: true))
                              .catchError((err) {
                            EasyLoading.showError(
                                err.response.data['message'],
                                duration: const Duration(seconds: 3),
                                dismissOnTap: true);
                          });
                        },
                        color: Colors.red,
                        child: const Text(
                          'BUY',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
