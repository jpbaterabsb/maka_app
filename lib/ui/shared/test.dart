import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final List<Item> items = [
    Item(itemID: 1, itemName: 'Item 1', quantity: 10),
    Item(itemID: 2, itemName: 'Item 2', quantity: 20),
    Item(itemID: 3, itemName: 'Item 3', quantity: 30),
    Item(itemID: 4, itemName: 'Item 4', quantity: 40),
    Item(itemID: 5, itemName: 'Item 5', quantity: 50),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flat List Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flat List'),
          backgroundColor: Colors.red,
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                items.removeAt(index);
              },
              background: Container(
                color: Colors.green,
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Icon(Icons.check),
                ),
              ),
              secondaryBackground: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: Icon(Icons.delete),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey.shade300,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 10.0,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.shopping_cart),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              items[index].itemName,
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              'Quantity: ${items[index].quantity}',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Item {
  final int itemID;
  final String itemName;
  final int quantity;

  Item({required this.itemID, required this.itemName, required this.quantity});
}
