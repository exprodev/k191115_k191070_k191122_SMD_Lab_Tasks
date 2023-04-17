import 'package:flutter/material.dart';
import 'package:my_shopping_app/my_list_items.dart';
import 'package:my_shopping_app/my_cart.dart';
import 'my_app_bar.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Items:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Expanded(child: MyListItems()),
            const SizedBox(height: 20),
            const Text(
              'Cart:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Expanded(child: MyCart()),
          ],
        ),
      ),
    );
  }
}
