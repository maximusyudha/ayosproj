import 'package:flutter/material.dart';
import 'package:ayosproj/screens/splash2.dart';

class SplashScreen extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const SplashScreen();

  @override
  Widget build(BuildContext context) {
    // Delay untuk menampilkan splash screen selama 3 detik
    Future.delayed(const Duration(seconds: 3), () {
      // Pindah ke halaman selanjutnya setelah menunggu
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Splash2()),
      );
    });

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
                'assets/images/s1.png',
                width: 381,
                height: 381,
              ),
              const SizedBox(height: 20),
              const Text(
                'AyoS membuka pintu dunia persewaan untuk Anda. Sewa barang impian Anda dengan cepat dan tanpa ribet.',
                style: TextStyle(
                  color: Color.fromARGB(0, 255, 255, 255), // Warna hitam
                  fontSize: 14,
                  fontFamily: 'Montserrat', // Menggunakan font Montserrat
                  // textAlign: TextAlign.center, // Opsional, jika ingin mengatur penempatan teks secara manual
                ),
                textAlign:
                    TextAlign.center, // Mengatur penempatan teks ke tengah
              ),
            ],
          ),
        ),
      ),
    );
  }
}
