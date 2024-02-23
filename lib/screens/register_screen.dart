import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_screen.dart'; // Import file login_screen.dart

class DummyData {
  static List<Map<String, String>> users = [
    {'name': 'John Doe', 'email': 'john@example.com', 'password': 'password1'},
    {
      'name': 'Jane Smith',
      'email': 'jane@example.com',
      'password': 'password2'
    },
    {
      'name': 'Michael Johnson',
      'email': 'michael@example.com',
      'password': 'password3'
    },
  ];
}

class RegisterScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _register(BuildContext context) {
    String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;

    // Simulasi penambahan pengguna baru
    DummyData.users.add({'name': name, 'email': email, 'password': password});

    // Tampilkan pesan sukses
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('PenRegisteran berhasil untuk $name'),
        duration: const Duration(seconds: 2),
      ),
    );
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
                    'Register',
                    style: TextStyle(
                      color: Colors.white, // Warna teks
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.only(right: 0),
                    child: Text(
                      'Fill the field and make your account',
                      style: GoogleFonts.nunito(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle:
                          const TextStyle(color: Colors.white), // Warna label
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
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
                  Padding(
                    padding: const EdgeInsets.only(right: 150.0),
                    child: Text(
                      'Password is required 8 Character',
                      style: GoogleFonts.nunito(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  ElevatedButton(
                    onPressed: () {
                      _register(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
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
                        'Register',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Already have an account? Masuk',
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
