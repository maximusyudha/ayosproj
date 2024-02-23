import 'package:ayosproj/screens/landing_page_screen.dart';
import 'package:ayosproj/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DummyData {
  static List<Map<String, String>> users = [
    {'email': 'admin', 'password': 'password1'},
  ];
}

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login(BuildContext context) {
    String email = emailController.text;
    String password = passwordController.text;

    bool isValidUser = DummyData.users
        .any((user) => user['email'] == email && user['password'] == password);

    if (isValidUser) {
      // Logika untuk aksi setelah login berhasil
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login berhasil'),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      // Tampilkan pesan error jika login gagal
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email atau kata sandi salah'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF2D3250), // Warna latar belakang
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(
                  top: 90.0, right: 20, left: 20, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white, // Warna teks
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.only(right: 0),
                    child: Text(
                      'Login for continue to our dashboard',
                      style: GoogleFonts.nunito(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Nama',
                      labelStyle:
                          const TextStyle(color: Colors.white), // Warna label
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle:
                          const TextStyle(color: Colors.white), // Warna label
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  GestureDetector(
                    onTap: () {
                      // Tambahkan logika untuk pengembalian password
                    },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot password?',
                        style: GoogleFonts.nunito(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      _login(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LandingPageScreen(),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.orangeAccent),
                      minimumSize:
                          MaterialStateProperty.all<Size>(const Size(348, 58)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                    child: Container(
                      width: 348,
                      height: 58,
                      alignment: Alignment.center,
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Not have an account yet? Register',
                      style: GoogleFonts.nunito(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.only(right: 0),
                    child: Text(
                      'or login with',
                      style: GoogleFonts.nunito(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/instagram.png',
                          width: 50, height: 50),
                      const SizedBox(
                          width:
                              20), // Jarak antara gambar Instagram dan Facebook
                      Image.asset('assets/images/facebook.png',
                          width: 50, height: 50),
                      const SizedBox(
                          width:
                              20), // Jarak antara gambar Facebook dan Twitter
                      Image.asset('assets/images/twitter.png',
                          width: 50, height: 50),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
