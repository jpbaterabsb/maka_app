import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:maka_tht/models/item.dart';
import 'package:maka_tht/models/show.dart';

class ShowService {
  late final Dio dio;
  get SHOW_ID => '222';
  ShowService() {
    dio = GetIt.instance.get<Dio>();
  }


  Future<Show> fetchUnique() async {
    var response  = await dio.get('/show');
    Show show = Show.fromJson(response.data);
    return show;
  }


  Future<void> buy(int itemId) async {
    try {
      await dio.post('/show/$SHOW_ID/buy_item/$itemId');
    } on DioError catch (e) {
      rethrow;
    }
    return;
  }
}