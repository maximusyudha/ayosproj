import 'package:flutter/material.dart';
import 'package:ayosproj/models/product.dart';
import 'package:ayosproj/screens/product_detail_screen.dart';

List<Product> getDummyProducts() {
  return [
    Product(
      name: 'Camera',
      shopName: 'TakeShop',
      imageUrl:
          'https://th.bing.com/th/id/R.535a98489ad47af0ba516be77df51f11?rik=r294h8QD7KGBDQ&riu=http%3a%2f%2fallthingsd.com%2ffiles%2f2013%2f01%2fX100S_FRONT_L_R.jpg&ehk=6uvOK%2f5z%2fFWFl7F%2fJ3CoBjQ7%2fRgYPvAOXR1STT4S4dc%3d&risl=&pid=ImgRaw&r=0',
      price: 'Rp 7,500,000',
      description: '50 items remaining',
    ),
    Product(
      name: 'Flower Bouquet',
      shopName: 'Florist',
      imageUrl:
          'https://th.bing.com/th/id/OIP.7S98ioyS2MNDJwPwSCkbMwHaHa?rs=1&pid=ImgDetMain',
      price: 'Rp 150,000',
      description: '50 items remaining',
    ),
    Product(
      name: 'Piknik Set',
      shopName: 'CeriaShop',
      imageUrl:
          'https://down-id.img.susercontent.com/file/d8ce825ea0b8b2c33592973dfad52785',
      price: 'Rp 1,000,000',
      description: '50 items remaining',
    ),
    Product(
      name: 'Kostum',
      shopName: 'H en Em',
      imageUrl:
          'https://th.bing.com/th/id/OIP.WoDopXZV8HiMssh2pv-0ZgHaMO?rs=1&pid=ImgDetMain',
      price: 'Rp 1,000,000',
      description: '50 items remaining',
    ),
    // Add more products as needed
  ];
}

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    List<Product> dummyProducts = getDummyProducts();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Favorite'),
      ),
      backgroundColor: const Color(0xFF2D3250),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        padding: const EdgeInsets.all(8.0),
        childAspectRatio:
            158 / 215, // Sesuaikan dengan lebar dan tinggi yang diinginkan
        children: List.generate(dummyProducts.length, (index) {
          return FavoriteCard(product: dummyProducts[index]);
        }),
      ),
    );
  }
}

class FavoriteCard extends StatelessWidget {
  final Product product;

  const FavoriteCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              product: product,
            ),
          ),
        );
      },
      child: SizedBox(
        width: 168,
        height: 238,
        child: Card(
          color: Colors.white, // Mengubah warna menjadi merah
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 155,
                height: 112,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0), // Atur margin top di sini
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(5.0)),
                    child: Image.network(
                      product.imageUrl,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.name,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          IconButton(
                            onPressed: () {
                              // Handle heart icon tap
                            },
                            icon: const Icon(Icons.favorite),
                            color: Colors.red,
                          ),
                        ],
                      ),
                      Text(
                        product.shopName,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.price,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailScreen(
                                    product: product,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.orange, // Warna latar belakang
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(
                                Icons.arrow_forward,
                                color: Colors.white, // Warna ikon
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
