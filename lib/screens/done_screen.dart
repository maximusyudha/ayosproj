import 'package:ayosproj/screens/landing_page_screen.dart';
import 'package:flutter/material.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D3250),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/done.png',
                width: 300,
                height: 330,
              ),
              const SizedBox(height: 20),
              const Text(
                'Pesanan Masuk!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Terima kasih atas pesanannya. Pesanan Anda akan disiapkan dan dikirim melalui kurir dalam 1-2 hari',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const Spacer(), // Menambahkan spacer untuk memastikan tombol tetap di bagian bawah
              ElevatedButton(
                onPressed: () {
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
                    'Done',
                    style: TextStyle(fontSize: 18, color: Colors.white),
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
