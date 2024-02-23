import 'package:ayosproj/screens/cart_screen.dart';
import 'package:ayosproj/screens/favorite_screen.dart';
import 'package:ayosproj/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ayosproj/widgets/popular_card.dart';
import 'package:ayosproj/widgets/option_bar.dart'; // Import popular_card.dart
import 'package:ayosproj/models/product.dart';

class LandingPageScreen extends StatelessWidget {
  LandingPageScreen({Key? key}) : super(key: key);

  List<Product> getDummyProducts() {
    return [
      Product(
        name: 'Camera',
        shopName: 'TakeShop',
        imageUrl:
            'https://th.bing.com/th/id/R.535a98489ad47af0ba516be77df51f11?rik=r294h8QD7KGBDQ&riu=http%3a%2f%2fallthingsd.com%2ffiles%2f2013%2f01%2fX100S_FRONT_L_R.jpg&ehk=6uvOK%2f5z%2fFWFl7F%2fJ3CoBjQ7%2fRgYPvAOXR1STT4S4dc%3d&risl=&pid=ImgRaw&r=0',
        price: 'Rp 7500000',
        description: '50 items remaining',
      ),
      Product(
        name: 'Flower Bouquet',
        shopName: 'Florist',
        imageUrl:
            'https://th.bing.com/th/id/OIP.7S98ioyS2MNDJwPwSCkbMwHaHa?rs=1&pid=ImgDetMain',
        price: 'Rp 150000',
        description: '50 items remaining',
      ),
      Product(
        name: 'Piknik Set',
        shopName: 'CeriaShop',
        imageUrl:
            'https://down-id.img.susercontent.com/file/d8ce825ea0b8b2c33592973dfad52785',
        price: 'Rp 1000000',
        description: '50 items remaining',
      ),
      Product(
          name: 'Kostum',
          shopName: 'H en Em',
          imageUrl:
              'https://th.bing.com/th/id/OIP.WoDopXZV8HiMssh2pv-0ZgHaMO?rs=1&pid=ImgDetMain',
          price: 'Rp 1000000',
          description: '50 items remaining'),
      // Add more products as needed
    ];
  }

  @override
  Widget build(BuildContext context) {
    List<Product> dummyProducts = getDummyProducts();
    return Scaffold(
      backgroundColor: const Color(0xFF2D3250),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 10.0),
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
                                // Add your comment icon onPressed logic here
                              },
                              icon: Image.asset(
                                'assets/images/bell.png',
                                width: 36,
                                height: 36,
                              ), // Provide the correct extension
                              iconSize: 36,
                              color: Colors.orange,
                            ),
                            const SizedBox(width: 5),
                            IconButton(
                              onPressed: () {
                                // Add your comment icon onPressed logic here
                              },
                              icon: Image.asset(
                                'assets/images/comments.png',
                                width: 36,
                                height: 36,
                              ), // Provide the correct extension
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
                            'Category',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                            height:
                                5), // Tambahkan ruang antara "Kategori" dan tombol
                        Wrap(
                          spacing: 10,
                          runSpacing: 20,
                          children: [
                            CategoryButton(
                                color: const Color(0xFFE4F3EA), // Kostum
                                icon: Image.asset(
                                  'assets/images/costume.png',
                                  width: 34,
                                  height: 34,
                                ),
                                label: 'Costume',
                                onPressed: () {
                                  Navigator.pushNamed(context, '/category',
                                      arguments: {
                                        'categoryType': 'custom'
                                      }); // Pass category type
                                },
                                categoryType: 'custom'),
                            CategoryButton(
                                color: const Color(0xFFFFECE8), // Camping
                                icon: Image.asset(
                                  'assets/images/camping.png',
                                  width: 34,
                                  height: 34,
                                ),
                                label: 'Camping',
                                onPressed: () {
                                  Navigator.pushNamed(context, '/category',
                                      arguments: {
                                        'categoryType': 'camping'
                                      }); // Pass category type
                                },
                                categoryType: 'camping'),
                            CategoryButton(
                                color: const Color(0xFFFFF6E4), // Kamera
                                icon: Image.asset(
                                  'assets/images/cam.png',
                                  width: 34,
                                  height: 34,
                                ),
                                label: 'Camera',
                                onPressed: () {
                                  Navigator.pushNamed(context, '/category',
                                      arguments: {
                                        'categoryType': 'camera'
                                      }); // Pass category type
                                },
                                categoryType: 'camera'),
                            CategoryButton(
                                color: const Color(0xFFF1EDFC), // Acara
                                icon: Image.asset(
                                  'assets/images/party.png',
                                  width: 34,
                                  height: 34,
                                ),
                                label: 'Event',
                                onPressed: () {
                                  Navigator.pushNamed(context, '/category',
                                      arguments: {
                                        'categoryType': 'event'
                                      }); // Pass category type
                                },
                                categoryType: 'event'),
                          ],
                        ),
                        const SizedBox(
                            height:
                                20), // Add space between search bar and "kategori"
                        const Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            'Popular',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        // Memanggil PopularCard di bawah teks "Popular"
                        SizedBox(
                          height: 367,
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
              ],
            ),
          ),
          OptionBar(
            icons: const [
              Icons.home_outlined,
              Icons.favorite_outline,
              Icons.shopping_cart_outlined,
              Icons.person_outline,
            ],
            onTapFunctions: [
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LandingPageScreen(),
                  ),
                );
              },
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FavoriteScreen(

                        // Pass your favorite products here
                        ),
                  ),
                );
              },
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartScreen(
                      cartItems: [], // Pass your favorite products here
                    ),
                  ),
                );
              },
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(
                        // Pass your favorite products here
                        ),
                  ),
                );
              },
            ],
            width: 390,
            height: 56,
            backgroundColor: Colors.black,
          ),
        ],
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final Color color;
  final Widget icon; // Menggunakan Widget untuk menampung gambar
  final String label;
  final VoidCallback onPressed;
  final String? categoryType;

  const CategoryButton({
    Key? key,
    required this.color,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.categoryType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80, // Lebar tombol kategori
      height: 100, // Tinggi tombol kategori
      child: GestureDetector(
        onTap: onPressed, // Tambahkan fungsi onPressed ke onTap
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 60, // Lebar ikon
              height: 60, // Tinggi ikon
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
              child: Center(child: icon), // Menampilkan gambar sebagai ikon
            ),
            Positioned(
              top: 80,
              bottom: 0,
              child: Text(
                label,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
