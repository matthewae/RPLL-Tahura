import 'package:flutter/material.dart';
import 'mmpengelola_screen.dart'; // Pastikan mengimpor screen yang dituju

class AddinfoScreen extends StatelessWidget {
  const AddinfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        elevation: 0,
        title: const Text(
          'Detail Kelola Informasi',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.green[300],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Jenis Informasi:',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                hintText: 'Masukkan jenis informasi',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Nama Informasi:',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                hintText: 'Masukkan nama informasi',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Masukkan Gambar:',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      hintText: 'Choose File',
                    ),
                    readOnly:
                        true, // Membuat text field hanya untuk display file name
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.image, color: Colors.white),
                  onPressed: () {
                    // Tambahkan fungsi untuk memilih gambar
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigasi ke screen mmpengelola_screen.dart
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MmpengelolaScreen()), // Gantilah dengan nama class screen tujuan
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Save Information',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
