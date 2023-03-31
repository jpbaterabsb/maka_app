import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:maka_tht/models/item.dart';

class ItemService {
  late final Dio dio;
  ItemService() {
    dio = GetIt.instance.get<Dio>();
  }


  Future<List<Item>> fetchAll() async {
    var response  = await dio.get('/inventory');
    List<Item> items = (response.data as List).map((item) => Item.fromJson(item)).toList();
    return items;
  }


  Future<void> save(Item item) async {
    await dio.post('/inventory', data: item.toJson());
    return;
  }
}