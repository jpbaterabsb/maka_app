import 'package:flutter/material.dart';
import 'package:maka_tht/ui/shared/local_list_item.dart';

class BuyPage extends StatefulWidget {
  const BuyPage({super.key});

  @override
  State<BuyPage> createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: Text('Items to buy'),
      ),
      body: ListItemWidget(buyMode: true),
    );
  }
}
