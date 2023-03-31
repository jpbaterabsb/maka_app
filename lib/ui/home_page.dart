import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:maka_tht/blocs/list_item_bloc.dart';
import 'package:maka_tht/ui/inventory/list_page.dart';
import 'package:maka_tht/ui/shared/item_widget.dart';
import 'package:maka_tht/ui/show_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {

  late TabController controller = TabController(length: 2, vsync: this);

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Premier Platform'),
        bottom: TabBar(
          tabs: const <Tab>[
            Tab(
              icon: Icon(Icons.inventory),
            ),
            Tab(
              icon: Icon(Icons.live_tv),
            ),
          ],
          controller: controller,
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: const <Widget>[
          InventoryListPage(),
          ShowPage()
        ],
      ),
    );
  }
}
