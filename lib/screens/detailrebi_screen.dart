import 'package:flutter/material.dart';
import 'CHrebi_screen.dart'; // Replace this path with the correct one.

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
  String? selectedJamSewa;
  String? selectedPengambilanSepeda;
  String? calculatedPengembalianSepeda;
  final totalPenyewaanController = TextEditingController();

  @override
  void dispose() {
    totalPenyewaanController.dispose();
    super.dispose();
  }

  final List<String> jamSewaOptions = [
    '1 Jam',
    '2 Jam',
    '3 Jam',
  ];

  final List<String> pengambilanTimes = [
    '08:00',
    '09:00',
    '10:00',
    '11:00',
    '12:00',
    '13:00',
    '14:00',
    '15:00',
  ];

  void calculatePengembalianSepeda() {
    if (selectedJamSewa != null && selectedPengambilanSepeda != null) {
      int jamSewa = int.parse(selectedJamSewa!.split(' ')[0]);
      int startHour = int.parse(selectedPengambilanSepeda!.split(':')[0]);
      int endHour = startHour + jamSewa;

      // Ensure endHour doesn't exceed 24 (assuming simple logic here)
      if (endHour <= 24) {
        setState(() {
          calculatedPengembalianSepeda =
              '${endHour.toString().padLeft(2, '0')}:00';
        });
      } else {
        setState(() {
          calculatedPengembalianSepeda = 'Invalid Time';
        });
      }
    }
  }

  void calculateTotal() {
    if (selectedJamSewa != null) {
      int jamSewa = int.parse(selectedJamSewa!.split(' ')[0]);
      int totalHarga = jamSewa * 10000; // Harga per jam Rp 10.000
      setState(() {
        totalPenyewaanController.text = "Rp. ${totalHarga.toString()}";
      });
    } else {
      setState(() {
        totalPenyewaanController.text = "Pilih durasi sewa terlebih dahulu";
      });
    }
  }

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
          "Pemesanan Sepeda",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/profile.jpg'), // Replace with profile image path.
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
            _buildDropDown("Jumlah Jam Sewa :", jamSewaOptions, selectedJamSewa,
                (value) {
              setState(() {
                selectedJamSewa = value;
                calculatePengembalianSepeda();
                calculateTotal(); // Update total secara otomatis
              });
            }),
            SizedBox(height: 20),
            _buildDropDown("Pengambilan Sepeda :", pengambilanTimes,
                selectedPengambilanSepeda, (value) {
              setState(() {
                selectedPengambilanSepeda = value;
                calculatePengembalianSepeda();
              });
            }),
            SizedBox(height: 14),
            Text(
              "Pengembalian Sepeda:",
              style: TextStyle(fontSize: 14),
            ),
            Text(
              calculatedPengembalianSepeda ??
                  "Pilih waktu pengambilan dan durasi",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 14),
            Text(
              "Total Penyewaan Sepeda",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: totalPenyewaanController,
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
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
                  style: TextStyle(
                      color: Colors.black), // Change text color to black.
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropDown(String label, List<String> options,
      String? selectedValue, ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14),
        ),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(),
          ),
          value: selectedValue,
          items: options.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
