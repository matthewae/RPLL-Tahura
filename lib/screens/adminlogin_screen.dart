import 'package:flutter/material.dart';
import 'mmpengelola_screen.dart'; // Import file mmpengelola_screen.dart

class AdminloginScreen extends StatelessWidget {
  const AdminloginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300], // Latar belakang hijau
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
          'LOGIN',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'ID Karyawan',
                hintStyle: const TextStyle(color: Colors.black54),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 16.0),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: const TextStyle(color: Colors.black54),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 16.0),
              ),
              obscureText: true, // Untuk menyembunyikan teks password
            ),
            const SizedBox(height: 32.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigasi ke MMPengelolaScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MmpengelolaScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Warna tombol sesuai gambar
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                ),
                child: const Text(
                  'LOGIN',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
