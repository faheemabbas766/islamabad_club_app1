import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/providers/shopping_cart_provider.dart';

class ShoppingCartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: context.watch<ShoppingCartProvider>().cart.items.length,
              itemBuilder: (context, index) {
                CartItem item = context.watch<ShoppingCartProvider>().cart.items[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text('Rs:${item.price}'),
                  trailing: Text('${item.quantity}x'),
                );
              },
            ),
          ),
          // Total price of the shopping cart
          Text('Total: Rs:${_calculateTotalPrice(context)}'),
        ],
      ),
    );
  }
  double _calculateTotalPrice(BuildContext context) {
    var cartProvider = context.watch<ShoppingCartProvider>();
    double total = 0;

    for (var item in cartProvider.cart.items) {
      total += item.price * item.quantity;
    }

    return total;
  }
}