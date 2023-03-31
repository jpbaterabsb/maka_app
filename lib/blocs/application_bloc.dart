import 'package:get_it/get_it.dart';
import 'package:maka_tht/blocs/list_item_bloc.dart';
import 'package:maka_tht/blocs/show_bloc.dart';

class ApplicationBloc {
  ApplicationBloc() {
    GetIt.instance.registerSingleton(ListItemsBloc());
    GetIt.instance.registerSingleton(ShowBloc());
  }
}