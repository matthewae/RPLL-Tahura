import 'package:flutter/material.dart';
import 'mpembayaran_screen.dart'; // Import the payment screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CHrebiScreen(),
    );
  }
}

class CHrebiScreen extends StatelessWidget {
  final namaPengunjungController = TextEditingController();
  final jumlahJamSewaController = TextEditingController();
  final jamPengambilanController = TextEditingController();
  final jamPengembalianController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(129, 212, 105, 1.000),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Check Out Pemesanan",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/profile.jpg'), // Replace with your profile image path
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
            _buildTextField("Nama Pengunjung :", namaPengunjungController),
            SizedBox(height: 14),
            _buildTextField("Jumlah Jam Sewa :", jumlahJamSewaController, suffixText: "Jam"),
            SizedBox(height: 14),
            _buildTextField("Jam Pengambilan Sepeda :", jamPengambilanController, suffixText: "Jam"),
            SizedBox(height: 14),
            _buildTextField("Jam Pengembalian Sepeda :", jamPengembalianController, suffixText: "Jam"),
            SizedBox(height: 14),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to MpembayaranScreen when button is clicked
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MpembayaranScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.black, // Set the text color to black
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                child: Text("Metode Pembayaran"),
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
          style: TextStyle(fontSize: 16),
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
