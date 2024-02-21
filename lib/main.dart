import 'package:flutter/material.dart';
import 'package:ayosproj/screens/landing_page_screen.dart'; // Import your LandingPageScreen file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LandingPageScreen(), // Set LandingPageScreen as the home screen
    );
  }
}
