import 'package:flutter/material.dart';

class ProfileDetailScreen extends StatelessWidget {
  const ProfileDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Foto Profil
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/foro.png'),
            ),
            const SizedBox(height: 20),
            // Garis
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width * 0.8,
              color: Colors.grey,
            ),
            const SizedBox(height: 20),
            // Detail Profil
            _buildDetailItem('Full Name', 'Michelle Lee', isTitleBold: true),
            _buildDetailItem('Birth', '29 February 2000', isTitleBold: true),
            _buildDetailItem('Gender', 'Female', isTitleBold: true),
            _buildDetailItem('Email', 'example@gmail.com', isTitleBold: true),
            _buildDetailItem('Call', '(+78) 813 29820949380',
                isTitleBold: true),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String title, String content,
      {bool isTitleBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: isTitleBold ? FontWeight.bold : FontWeight.normal,
              fontSize: 16,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              content,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 16,
                fontWeight: isTitleBold ? FontWeight.normal : FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
