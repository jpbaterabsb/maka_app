import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:maka_tht/models/item.dart';
import 'package:maka_tht/service/show_service.dart';

import '../service/item_service.dart';

class ListItemsBloc extends Cubit<List<Item>> {
  var itemService = GetIt.instance.get<ItemService>();
  var showService = GetIt.instance.get<ShowService>();

  ListItemsBloc() : super([]);

  fetchAll() async {
   var items = await itemService.fetchAll();
   emit(items);
  }

  Future<void> save(Item item) async {
    await itemService.save(item);
  }

  Future<void> saveAndFetch(Item item) async {
    await itemService.save(item);
    await fetchAll();
  }
}