import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:maka_tht/blocs/show_bloc.dart';
import 'package:maka_tht/models/show.dart';

class ShowPage extends StatefulWidget {
  const ShowPage({super.key});

  @override
  State<ShowPage> createState() => _ShowPageState();
}

class _ShowPageState extends State<ShowPage> {
  var showBloc = GetIt.instance.get<ShowBloc>();
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    EasyLoading.show();
    showBloc.fetchSales().whenComplete(() => EasyLoading.dismiss());
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<ShowBloc, Show>(
          builder: (context, show) => ListView.builder(
            itemBuilder: (context, index) => Card(
              elevation: 5,
              child: Container(
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.check_circle_outline, size: 40, color: Colors.white),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                             "${show?.getSalesItems[index]?.itemName ?? 'UNKOWN'} was successfully sold",
                            style: const TextStyle(fontSize: 16.0, color: Colors.white
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            itemCount: show.getSalesItems.length,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 40,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.red,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/buy')
                    .then((value) => showBloc.fetchSales());
                  },

                  child: const Text('Buy an Item'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
