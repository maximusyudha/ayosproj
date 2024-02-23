import 'package:flutter/material.dart';
import 'package:ayosproj/screens/splash_screen.dart';
import 'package:ayosproj/screens/landing_page_screen.dart'; // Import your LandingPageScreen file
import 'package:ayosproj/screens/category_screen.dart'; // Import your CategoryScreen file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/', // Set the initial route
      routes: {
        '/': (context) => const SplashScreen(), // Define route for SplashScreen
        '/landing': (context) =>
            LandingPageScreen(), // Define route for LandingPageScreen
        '/category': (context) =>
            CategoryScreen(), // Define route for CategoryScreen
      },
    );
  }
}
