import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:maka_tht/blocs/list_item_bloc.dart';
import 'package:maka_tht/models/item.dart';
import 'package:maka_tht/models/show.dart';
import 'package:maka_tht/service/show_service.dart';

import '../service/item_service.dart';

class ShowBloc extends Cubit<Show> {
  var showService = GetIt.instance.get<ShowService>();
  var listItemBloc = GetIt.instance.get<ListItemsBloc>();

  ShowBloc() : super(Show());

  Future<void> fetchSales() async {
    var show = await showService.fetchUnique();
    emit(show);
  }

  Future<void> buyAndFetchItems(int itemId) async {
    try {
      await showService.buy(itemId);
      await fetchSales();
      await listItemBloc.fetchAll();
    } on DioError catch (e) {
      rethrow;
    }
  }
}