import 'package:flutter/material.dart';
import 'package:my_shopping_app/cart_model.dart';
import 'package:my_shopping_app/item.dart';
import 'package:provider/provider.dart';

class MyListItems extends StatelessWidget {
  const MyListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) {
        final item = _items[index];
        return ListTile(
          leading: const Icon(Icons.shopping_cart),
          title: Text(item.name),
          subtitle: Text('\$${item.price}'),
          trailing: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Provider.of<CartModel>(context, listen: false).addItem(item);
            },
          ),
        );
      },
    );
  }
}

final List<Item> _items = [
  Item(name: 'Item 1', price: 10),
  Item(name: 'Item 2', price: 20),
  Item(name: 'Item 3', price: 30),
  Item(name: 'Item 4', price: 40),
];
