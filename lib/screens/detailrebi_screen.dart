import 'package:flutter/material.dart';
import 'CHrebi_screen.dart'; // Pastikan Anda mengganti path ini dengan path yang benar

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DetailrebiScreen(),
    );
  }
}

class DetailrebiScreen extends StatefulWidget {
  @override
  _DetailrebiScreenState createState() => _DetailrebiScreenState();
}

class _DetailrebiScreenState extends State<DetailrebiScreen> {
  final jenisSepedaController = TextEditingController();
  final jumlahJamSewaController = TextEditingController();
  final pengambilanSepedaController = TextEditingController();
  final pengembalianSepedaController = TextEditingController();
  final totalPenyewaanController = TextEditingController();

  @override
  void dispose() {
    jenisSepedaController.dispose();
    jumlahJamSewaController.dispose();
    pengambilanSepedaController.dispose();
    pengembalianSepedaController.dispose();
    totalPenyewaanController.dispose();
    super.dispose();
  }

  void calculateTotal() {
    setState(() {
      totalPenyewaanController.text = "Rp. 100000"; // Contoh hasil total penyewaan
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(223, 59, 173, 44),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Pemesanan Sepeda",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/profile.jpg'), // Ganti dengan path foto profil
              radius: 20,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField("Jenis Sepeda :", jenisSepedaController),
            SizedBox(height: 14),
            _buildTextField("Jumlah Jam Sewa :", jumlahJamSewaController, suffixText: "Jam"),
            SizedBox(height: 14),
            _buildTextField("Pengambilan Sepeda :", pengambilanSepedaController, suffixText: "Jam"),
            SizedBox(height: 14),
            _buildTextField("Pengembalian Sepeda :", pengembalianSepedaController, suffixText: "Jam"),
            SizedBox(height: 14),
            Text(
              "Total Penyewaan Sepeda",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: totalPenyewaanController,
              readOnly: true,
              decoration: InputDecoration(
                prefixText: "Rp ",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  calculateTotal();  // Hitung total
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CHrebiScreen()), 
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 30, 138, 226),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  "Check Out",
                  style: TextStyle(color: Colors.black), // Mengubah warna teks menjadi hitam
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {String suffixText = ""}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14),
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            suffixText: suffixText,
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }
}
