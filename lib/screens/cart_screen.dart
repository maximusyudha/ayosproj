import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import intl package for formatting numbers
import 'package:ayosproj/models/product.dart';

class CartScreen extends StatelessWidget {
  final List<Product> cartItems;

  const CartScreen({Key? key, required this.cartItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalPrice = 0;

    // Calculate total price
    for (var item in cartItems) {
      // Remove non-numeric characters and parse the remaining string to double
      var numericPrice =
          double.parse(item.price.replaceAll(RegExp(r'[^0-9.]'), ''));
      totalPrice += numericPrice;
    }

    // Format total price to Rupiah
    final formatCurrency = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');
    String totalPriceFormatted = formatCurrency.format(totalPrice);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length + 1, // +1 for total price row
        itemBuilder: (context, index) {
          if (index < cartItems.length) {
            final product = cartItems[index];
            return Card(
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(product.imageUrl),
                ),
                title: Text(product.name),
                subtitle: Text('Price: ${product.price}'),
                // Add any other relevant information about the product
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    // Implement delete functionality
                  },
                ),
              ),
            );
          } else {
            return Card(
              margin: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      'Total Price:',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      totalPriceFormatted,
                      style: const TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
