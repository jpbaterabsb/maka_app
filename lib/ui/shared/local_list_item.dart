import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maka_tht/blocs/list_item_bloc.dart';
import 'package:maka_tht/models/item.dart';
import 'package:maka_tht/ui/shared/item_widget.dart';

class ListItemWidget extends StatelessWidget {
  bool buyMode;
  ListItemWidget({
    super.key,
    required this.buyMode
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListItemsBloc, List<Item>>(
      builder: (context, itemList) {
        return ItemWidget(
          buyMode: buyMode,
          key: const Key('listItem'),
          onTap: (item) => Navigator.of(context)
              .pushNamed('/inventory/add', arguments: {'item': item}),
          items: itemList,
        );
      },
    );
  }
}