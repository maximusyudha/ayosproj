import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ayosproj/widgets/popular_card.dart';
import 'package:ayosproj/widgets/option_bar.dart'; // Import popular_card.dart
import 'package:ayosproj/models/product.dart';

class LandingPageScreen extends StatelessWidget {
  const LandingPageScreen({Key? key}) : super(key: key);

  List<Product> getDummyProducts() {
    return [
      Product(
        name: 'Camera',
        shopName: 'TakeShop',
        imageUrl:
            'https://th.bing.com/th/id/R.535a98489ad47af0ba516be77df51f11?rik=r294h8QD7KGBDQ&riu=http%3a%2f%2fallthingsd.com%2ffiles%2f2013%2f01%2fX100S_FRONT_L_R.jpg&ehk=6uvOK%2f5z%2fFWFl7F%2fJ3CoBjQ7%2fRgYPvAOXR1STT4S4dc%3d&risl=&pid=ImgRaw&r=0',
        price: 'Rp 7,500,000',
        description: 'Sekarang Tersedia 50',
      ),
      Product(
        name: 'Flower Bouquet',
        shopName: 'Florist',
        imageUrl:
            'https://th.bing.com/th/id/OIP.7S98ioyS2MNDJwPwSCkbMwHaHa?rs=1&pid=ImgDetMain',
        price: 'Rp 150,000',
        description: 'Sekarang Tersedia 50',
      ),
      Product(
        name: 'Piknik Set',
        shopName: 'CeriaShop',
        imageUrl:
            'https://down-id.img.susercontent.com/file/d8ce825ea0b8b2c33592973dfad52785',
        price: 'Rp 1,000,000',
        description: 'Sekarang Tersedia 50',
      ),
      Product(
          name: 'Kostum',
          shopName: 'H en Em',
          imageUrl:
              'https://th.bing.com/th/id/OIP.WoDopXZV8HiMssh2pv-0ZgHaMO?rs=1&pid=ImgDetMain',
          price: 'Rp 1,000,000',
          description: 'Sekarang Tersedia 50'),
      // Add more products as needed
    ];
  }

  @override
  Widget build(BuildContext context) {
    List<Product> dummyProducts = getDummyProducts();
    return Scaffold(
      backgroundColor: const Color(0xFF2D3250),
      body: SingleChildScrollView(
        // Wrap the Column with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Hello, Michelle Lee!',
                  style: GoogleFonts.nunito(
                    fontSize: 16.6554164886,
                    fontWeight: FontWeight.w700,
                    height: 1.3125000644,
                    letterSpacing: 0.0499662515,
                    color: const Color(0xfff8b179),
                  ),
                ),
              ),
              const SizedBox(height: 10), // Add space between the texts
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Purwokerto, Jawa Tengah',
                  style: GoogleFonts.nunito(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ), // Add space between the text and search bar
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: SizedBox(
                  width: 400,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                              ),
                              child: const Row(
                                children: [
                                  Icon(Icons.search),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Cari',
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 0),
                          IconButton(
                            onPressed: () {
                              // Add your notification bell icon onPressed logic here
                            },
                            icon: const Icon(Icons.notifications),
                            iconSize: 36,
                            color: Colors.orange,
                          ),
                          const SizedBox(width: 5),
                          IconButton(
                            onPressed: () {
                              // Add your comment icon onPressed logic here
                            },
                            icon: const Icon(Icons.comment),
                            iconSize: 36,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      const SizedBox(
                          height:
                              20), // Add space between search bar and "kategori"
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Kategori',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                          height:
                              10), // Add space between "Kategori" and buttons
                      const Row(
                        children: [
                          CategoryButton(
                            color: Colors.lightGreen,
                            icon: Icons.shopping_bag,
                            label: 'Kostum',
                          ),
                          CategoryButton(
                            color: Color.fromARGB(255, 255, 176, 203),
                            icon: Icons.house,
                            label: 'Kamping',
                          ),
                          CategoryButton(
                            color: Color.fromARGB(255, 251, 249, 153),
                            icon: Icons.camera,
                            label: 'Camera',
                          ),
                          CategoryButton(
                            color: Color.fromARGB(255, 255, 215, 249),
                            icon: Icons.event,
                            label: 'Acara',
                          ),
                        ],
                      ),
                      const SizedBox(
                          height:
                              20), // Add space between search bar and "kategori"
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Populer',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      // Memanggil PopularCard di bawah teks "Popular"
                      SizedBox(
                        height: 400,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 168 / 238,
                          ),
                          itemCount: dummyProducts.length,
                          itemBuilder: (context, index) {
                            return PopularCard(product: dummyProducts[index]);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const OptionBar(
                icons: [
                  Icons.home,
                  Icons.favorite,
                  Icons.shopping_cart,
                  Icons.person,
                ],
                width: 390,
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String label;

  const CategoryButton({
    Key? key,
    required this.color,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
