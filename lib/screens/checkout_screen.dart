import 'package:ayosproj/screens/done_screen.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key});

  // Fungsi untuk mengubah alamat

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Address',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Informasi alamat
                SizedBox(height: 5),
                Text(
                  'Michelle Lee',
                  style: TextStyle(fontSize: 16.0),
                ),
                Text(
                  'Perumahan Berkoh Indah, blok E2 no 286. Jl beringin, Jawa Tengah, Kab. Banyumas, Purwokerto Selatan',
                  style: TextStyle(fontSize: 16.0),
                ),
                Text(
                  '+62 8571266 0150',
                  style: TextStyle(fontSize: 16.0),
                ),
                Divider(
                  color: Colors.grey,
                  height: 30.0,
                ),
                Text(
                  'Metode Pembayaran',
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            // Tambahkan gambar bank untuk setiap metode pembayaran
            Column(
              children: [
                _buildPaymentMethodRow(
                  imageUrl:
                      'https://th.bing.com/th/id/OIP.Sc-UqaH3io_N7pyag99BoAHaHa?rs=1&pid=ImgDetMain',
                  name: 'BCA',
                ),
                _buildPaymentMethodRow(
                  imageUrl:
                      'https://th.bing.com/th/id/OIP.AuySA9bVI4sy0WAFfYBSVAAAAA?rs=1&pid=ImgDetMain',
                  name: 'BNI',
                ),
                _buildPaymentMethodRow(
                  imageUrl:
                      'https://th.bing.com/th/id/OIP.dIXYnJX-9WPxpwYYAEiJTQAAAA?rs=1&pid=ImgDetMain',
                  name: 'Mandiri',
                ),
              ],
            ),
            const Divider(
              color: Colors.grey,
              height: 30.0,
            ),
            // Informasi harga dan pembayaran (contoh)
            _buildPaymentInfoRow('Harga Item', 'Rp 30.0000'),
            _buildPaymentInfoRow('Harga Sewa per hari', 'Rp 5000/day'),
            _buildPaymentInfoRow('Biaya Pengiriman', 'Rp 5000'),
            _buildPaymentInfoRow('Total', 'Rp 40.000'),

            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DoneScreen(key: Key("Done")),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orangeAccent,
                minimumSize: const Size(348, 58),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              child: const Text(
                'Pay Now',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodRow(
      {required String imageUrl, required String name}) {
    return Row(
      children: [
        Image.network(
          imageUrl,
          width: 50,
          height: 50,
        ),
        const SizedBox(width: 10), // Jarak antara gambar dan teks
        Text(name),
      ],
    );
  }

  Widget _buildPaymentInfoRow(String title, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.black),
        ),
        Text(
          amount,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
