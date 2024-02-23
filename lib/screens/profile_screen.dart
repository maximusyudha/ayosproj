import 'package:ayosproj/screens/cart_screen.dart';
import 'package:ayosproj/screens/favorite_screen.dart';
import 'package:ayosproj/screens/landing_page_screen.dart';
import 'package:ayosproj/screens/login_screen.dart';
import 'package:ayosproj/screens/profile_detail_screen.dart';
import 'package:ayosproj/widgets/option_bar.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF2D3250), // atas
                Color(0xFF676F9D), // tengah
                Color(0xFFFFFFFF), // bawah
              ],
              stops: [0.0, 0.5, 1.0],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              // Foto
              Container(
                width: 243,
                height: 176,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/profilee.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              // Nama
              const Text(
                'Michelle Lee',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
              // Email
              const Text(
                'MichelleLee@example.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              // Tombol-tombol
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    _buildButton('Profile', Icons.person, () {
                      // Navigasi ke layar profil
                      // Misalnya:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfileDetailScreen()),
                      );
                    }),
                    _buildButton('Address', Icons.location_on, () {}),
                    _buildButton('Notification', Icons.notifications, () {}),
                    _buildButton('Help?', Icons.help, () {}),
                    _buildButton('Log Out', Icons.exit_to_app, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    }),
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
        ),
      ),
    );
  }

  Widget _buildButton(String text, IconData iconData, Function() onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 68,
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.33),
          color: Colors.white,
        ),
        child: Row(
          children: [
            const SizedBox(width: 20),
            Icon(iconData),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
