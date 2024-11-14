import 'package:flutter/material.dart';
import 'kelrebi_screen.dart';

class InvsepedaScreen extends StatelessWidget {
  const InvsepedaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Controller untuk mendapatkan nilai input
    final TextEditingController jenisSepedaController = TextEditingController();
    final TextEditingController hargaSewaController = TextEditingController();
    final TextEditingController stockController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Inventaris Sepeda',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Jenis Sepeda:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: jenisSepedaController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            const Text(
              'Harga Sewa Sepeda:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: hargaSewaController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            const Text(
              'Stock Sepeda:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: stockController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Simpan data di sini
                  String jenisSepeda = jenisSepedaController.text;
                  String hargaSewa = hargaSewaController.text;
                  String stock = stockController.text;

                  // Logika penyimpanan data, misalnya dengan memanggil fungsi simpan
                  // atau menyimpan ke database

                  // Navigasi kembali ke KelrebiScreen setelah menyimpan
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => KelrebiScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
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
