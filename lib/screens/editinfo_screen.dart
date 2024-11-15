import 'package:flutter/material.dart';
import 'addinfo_screen.dart'; // Pastikan path import sesuai dengan lokasi file AddinfoScreen

class EditinfoScreen extends StatelessWidget {
  const EditinfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(129, 212, 105, 1.000),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
        title: const Text(
          'Kelola Informasi',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.black),
            onPressed: () {
              // Navigasi ke halaman AddinfoScreen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddinfoScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildInfoButton('Flora', Icons.nature),
            const SizedBox(height: 16.0),
            _buildInfoButton('Fauna', Icons.pets),
            const SizedBox(height: 16.0),
            _buildInfoButton('Spot', Icons.location_on),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membangun tombol informasi
  Widget _buildInfoButton(String title, IconData icon) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(icon, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
