import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:maka_tht/service/show_service.dart';

import 'item_service.dart';

class ApplicationService {
  ApplicationService(Dio dio) {
    GetIt.instance.registerSingleton(dio);
    GetIt.instance.registerSingleton(ItemService());
    GetIt.instance.registerSingleton(ShowService());
  }
}