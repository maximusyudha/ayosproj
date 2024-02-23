import 'package:flutter/material.dart';
import 'package:ayosproj/screens/splash3.dart';

class Splash2 extends StatelessWidget {
  const Splash2({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.transparent, // Set background color to transparent
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF2D3250), // Warna atas: 2D3250
              Color(0xFF676F9D), // Warna tengah: 676F9D
              Color(0xFF03040B), // Warna bawah: 03040B
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Tambahkan gambar splash screen Anda di sini
              Image.asset(
                'assets/images/s2.png',
                width: 381,
                height: 381,
              ),
              const SizedBox(height: 10),
              const Text(
                'AyoS membuka pintu dunia persewaan untuk Anda. Sewa barang impian Anda dengan cepat dan tanpa ribet.',
                style: TextStyle(
                  color: Colors.white, // Warna teks putih
                  fontSize: 20,
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  // Navigasi ke halaman Splash3 ketika gambar ditekan
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Splash3(),
                    ),
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Selanjutnya',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
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
