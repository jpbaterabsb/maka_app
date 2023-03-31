import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:maka_tht/blocs/list_item_bloc.dart';
import '../shared/local_list_item.dart';

class InventoryListPage extends StatefulWidget {
  const InventoryListPage({super.key});

  @override
  State<InventoryListPage> createState() => _InventoryListPagesState();
}

class _InventoryListPagesState extends State<InventoryListPage> {
  final listItemBloc  = GetIt.instance.get<ListItemsBloc>();


  @override
  void initState() {
    super.initState();
    listItemBloc.fetchAll();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListItemWidget(buyMode: false),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed('/inventory/add'),
        tooltip: 'Add item',
        child: const Icon(Icons.add),
      ),
    );
  }
}
