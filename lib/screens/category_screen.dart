import 'package:ayosproj/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ayosproj/models/product.dart'; // Import your Product model
// Import the data file where you have defined the getDummyProducts function

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String categoryType = args['categoryType'];

    // Retrieve the list of products
    final List<Product> allProducts = getDummyProducts();

    // Filter products based on the category
    final List<Product> categoryProducts = allProducts
        .where((product) => product.category == categoryType)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Category: $categoryType'),
      ),
      body: ListView.builder(
        itemCount: categoryProducts.length,
        itemBuilder: (context, index) {
          final Product product = categoryProducts[index];
          // Format the price to Indonesian Rupiah
          final formattedPrice =
              NumberFormat.currency(locale: 'id_ID', symbol: 'Rp')
                  .format(double.parse(product.price));

          return ListTile(
            leading: Image.network(
              product.imageUrl,
              width: 50,
              height: 50,
            ),
            title: Text(product.name),
            subtitle: Text(product.description),
            trailing: Text(formattedPrice), // Display formatted price
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(product: product),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
