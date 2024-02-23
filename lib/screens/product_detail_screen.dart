import 'package:ayosproj/screens/cart_screen.dart';
import 'package:ayosproj/screens/rent_screen.dart';
import 'package:ayosproj/widgets/spesification_item.dart';
import 'package:flutter/material.dart';
import 'package:ayosproj/models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: SizedBox(
          width: double.infinity,
          height: kToolbarHeight,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: kToolbarHeight * 0.7,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black),
                  ),
                  child: const Row(
                    children: [
                      SizedBox(width: 8),
                      Icon(Icons.search),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration.collapsed(
                            hintText: 'Cari produk',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(
                        cartItems: [product],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0,
                  70.0), // Adjust bottom padding according to button height
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    product.imageUrl,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 154,
                        height: 47,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromARGB(255, 222, 238, 204),
                        ),
                        child: Center(
                          child: Text(
                            product.price,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              // Decrease item count
                            },
                            icon: const Icon(Icons.remove),
                          ),
                          const Text(
                            '1', // Replace with appropriate item count
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              // Increase item count
                            },
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Item Description',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const ItemSpecification(
                    title: 'Kodak M35',
                    specifications: [
                      'Film format: 135 film (35mm)',
                      'ISO 200/400',
                      'Optic Lens: 31mm, F=10, 1 element',
                      'Focusing: free, 1m',
                      'Shutter Speed: 11/120s',
                      'CONDITION LIKE NEW',
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              color: Colors.white, // Change color as per your design
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // Open chat screen
                    },
                    icon: Image.asset(
                      'assets/images/comment2.png',
                      width: 31,
                      height: 24,
                    ),
                    iconSize: 30,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 20, height: 56),
                  Expanded(
                    child: SizedBox(
                      height: 58,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CartScreen(
                                cartItems: [product],
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          backgroundColor: const Color(0xFF2D3250),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Cart',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: SizedBox(
                      height: 58,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RentScreen(product),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Rent Now',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
