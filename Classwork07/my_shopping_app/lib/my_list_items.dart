import 'package:flutter/material.dart';
import 'package:my_shopping_app/cart_model.dart';
import 'package:my_shopping_app/item.dart';
import 'package:provider/provider.dart';

class MyListItems extends StatelessWidget {
  final CartModel cart;

  const MyListItems({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) {
        final item = _items[index];
        return ListTile(
          leading: const Icon(Icons.shopping_cart),
          title: Text(item.name),
          subtitle: Text('Rs. ${item.price}'),
          trailing: cart.items.contains(item) // check if item is in cart
              ? IconButton(
                  icon: const Icon(
                      Icons.check), // use a check icon if item is in cart
                  onPressed:
                      null, // disable the button if item is already in cart
                )
              : IconButton(
                  icon: const Icon(
                      Icons.add), // use an add icon if item is not in cart
                  onPressed: () {
                    Provider.of<CartModel>(context, listen: false)
                        .addItem(item);
                  },
                ),
        );
      },
    );
  }
}

final List<Item> _items = [
  Item(name: 'Cotton T-Shirt', price: 1500),
  Item(name: 'Denim Jeans', price: 3000),
  Item(name: 'Leather Jacket', price: 8000),
  Item(name: 'Sports Shoes', price: 5000),
  Item(name: 'Running Shoes', price: 4500),
  Item(name: 'Formal Shoes', price: 6000),
  Item(name: 'Leather Belt', price: 1500),
  Item(name: 'Leather Wallet', price: 2500),
  Item(name: 'Sunglasses', price: 3000),
  Item(name: 'Digital Watch', price: 4000),
  Item(name: 'Leather Strap Watch', price: 5000),
  Item(name: 'Smart Watch', price: 10000),
  Item(name: 'Laptop Backpack', price: 3500),
  Item(name: 'Leather Briefcase', price: 10000),
  Item(name: 'Cotton Polo Shirt', price: 2000),
  Item(name: 'Cotton Dress Shirt', price: 3000),
  Item(name: 'Chinos', price: 2500),
  Item(name: 'Khaki Shorts', price: 1500),
  Item(name: 'Leather Sandals', price: 3000),
  Item(name: 'Leather Loafers', price: 5000),
];
