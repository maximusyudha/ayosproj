import 'package:flutter/material.dart';
import 'package:ayosproj/models/product.dart';

class CartScreen extends StatelessWidget {
  final List<Product> cartItems;

  const CartScreen({Key? key, required this.cartItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final product = cartItems[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text(product.price),
            // Add any other relevant information about the product
          );
        },
      ),
    );
  }
}
