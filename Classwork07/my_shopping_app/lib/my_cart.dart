import 'package:flutter/material.dart';
import 'package:my_shopping_app/cart_model.dart';
import 'package:provider/provider.dart';

class MyCart extends StatelessWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, cart, child) {
        return ListView.builder(
          itemCount: cart.items.length + 1, // add 1 for the total cost widget
          itemBuilder: (context, index) {
            if (index < cart.items.length) {
              final item = cart.items[index];
              return ListTile(
                title: Text(item.name),
                subtitle: Text('Rs. ${item.price}'),
                trailing: IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    Provider.of<CartModel>(context, listen: false)
                        .removeItem(item);
                  },
                ),
              );
            } else {
              // display total cost widget
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Cost:'),
                    Text('Rs. ${cart.totalPrice.toStringAsFixed(2)}'),
                  ],
                ),
              );
            }
          },
        );
      },
    );
  }
}
