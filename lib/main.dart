import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:maka_tht/blocs/application_bloc.dart';
import 'package:maka_tht/blocs/list_item_bloc.dart';
import 'package:maka_tht/blocs/show_bloc.dart';
import 'package:maka_tht/service/application_service.dart';
import 'package:maka_tht/ui/buy_page.dart';
import 'package:maka_tht/ui/home_page.dart';
import 'package:maka_tht/ui/inventory/add_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key}) {

     var baseUrl = isSimulator()// ignore: unused_local_variable
        ? (isIOS() ? 'http://localhost:3333' : 'http://10.0.2.2:3333')
        : 'http://192.168.1.8:3333'; // replace with your ip
    GetIt.instance.registerSingleton(ApplicationService(Dio(BaseOptions(baseUrl: 'http://localhost:3333'))));
    GetIt.instance.registerSingleton(ApplicationBloc());
  }

   bool isSimulator() {
     if (Platform.isIOS || Platform.isAndroid) {
       var device = Platform.localHostname.toLowerCase();
       if (device.contains('simulator') || device.contains('emulator')) {
         return true;
       }
     }
     return false;
   }

   bool isIOS() {
     return Platform.isIOS || Platform.isMacOS;
   }

   @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<ListItemsBloc>(create: (_) => GetIt.instance.get<ListItemsBloc>()),
      BlocProvider<ShowBloc>(create: (_) => GetIt.instance.get<ShowBloc>())
    ], child: MaterialApp(
      title: 'Premier Platform',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      builder: EasyLoading.init(),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/inventory/add': (context) => const InventoryAddPage(),
        '/buy': (context) => const BuyPage(),
      },
    ));
      
      
  }
}


