import 'package:flutter/material.dart';
import 'mpembayaran_screen.dart';

class CHrebiScreen extends StatelessWidget {
  const CHrebiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;

    if (arguments is! Map<String, dynamic>) {
      return Scaffold(
        backgroundColor: const Color.fromRGBO(129, 212, 105, 1.0),
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text(
            'Data tidak valid. Pastikan data yang dikirim sesuai format.',
            style: TextStyle(color: Colors.red, fontSize: 16),
          ),
        ),
      );
    }

    final String bikeType = arguments['bikeType']?.toString() ?? 'Tidak diketahui';
    final String price = arguments['price']?.toString() ?? 'Tidak diketahui';
    final String jumlahJamSewa = arguments['jumlahJamSewa']?.toString() ?? 'Tidak diketahui';
    final String jamPengambilan = arguments['jamPengambilan']?.toString() ?? 'Tidak diketahui';
    final String jamPengembalian = arguments['jamPengembalian']?.toString() ?? 'Tidak diketahui';

    return Scaffold(
      backgroundColor: const Color.fromRGBO(129, 212, 105, 1.0),
      appBar: AppBar(
        title: const Text('Checkout Pemesanan'),
        backgroundColor: const Color.fromRGBO(129, 212, 105, 1.0),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLabeledField('Jenis Sepeda', bikeType),
            _buildLabeledField('Harga', price),
            _buildLabeledField('Jumlah Jam Sewa', '$jumlahJamSewa Jam'),
            _buildLabeledField('Jam Pengambilan', '$jamPengambilan Jam'),
            _buildLabeledField('Jam Pengembalian', '$jamPengembalian Jam'),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  backgroundColor: Colors.white,
                  foregroundColor: const Color.fromRGBO(129, 212, 105, 1.0),
                  elevation: 5,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MpembayaranScreen(),
                      settings: RouteSettings(
                        arguments: {
                          'bikeType': bikeType,
                          'price': price,
                          'jumlahJamSewa': jumlahJamSewa,
                          'jamPengambilan': jamPengambilan,
                          'jamPengembalian': jamPengembalian,
                        },
                      ),
                    ),
                  );
                },
                child: const Text(
                  'Konfirmasi Checkout',
                  style: TextStyle(
                    fontSize: 16,
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

  Widget _buildLabeledField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label :',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18, // Label lebih besar
            ),
          ),
          const SizedBox(height: 6),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              readOnly: true,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
              controller: TextEditingController(text: value),
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
