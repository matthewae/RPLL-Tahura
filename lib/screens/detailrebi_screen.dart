import 'package:flutter/material.dart';
import 'CHrebi_screen.dart'; // Replace with the correct path.
import 'profile_screen.dart'; // Import ProfileScreen.

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

  List<String> filteredPengambilanTimes() {
    if (selectedJamSewa == '3 Jam') {
      return pengambilanTimes.where((time) {
        int hour = int.parse(time.split(':')[0]);
        return hour <= 13; // Maksimal pengambilan jam 13:00
      }).toList();
    } else if (selectedJamSewa == '2 Jam') {
      return pengambilanTimes.where((time) {
        int hour = int.parse(time.split(':')[0]);
        return hour <= 14; // Maksimal pengambilan jam 14:00
      }).toList();
    }
    return pengambilanTimes; // Tidak ada batasan untuk 1 Jam
  }

  void calculatePengembalianSepeda() {
    if (selectedJamSewa != null && selectedPengambilanSepeda != null) {
      int jamSewa = int.parse(selectedJamSewa!.split(' ')[0]);
      int startHour = int.parse(selectedPengambilanSepeda!.split(':')[0]);
      int endHour = startHour + jamSewa;

      if (endHour <= 16) { // Pastikan tidak melebihi jam 16:00
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

  void validateAndCheckout() {
    if (selectedJamSewa == null || selectedPengambilanSepeda == null) {
      String errorMessage = '';
      if (selectedJamSewa == null) {
        errorMessage += 'Pilih jumlah jam sewa.\n';
      }
      if (selectedPengambilanSepeda == null) {
        errorMessage += 'Pilih waktu pengambilan.';
      }

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Peringatan'),
            content: Text(errorMessage),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CHrebiScreen()),
      );
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
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/profile.jpg'),
                radius: 20,
              ),
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
                selectedPengambilanSepeda = null; // Reset pengambilan sepeda
                calculatePengembalianSepeda();
                calculateTotal();
              });
            }),
            SizedBox(height: 20),
            _buildDropDown("Pengambilan Sepeda :", filteredPengambilanTimes(),
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
              calculatedPengembalianSepeda ?? "Pilih waktu pengambilan dan durasi",
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
                onPressed: validateAndCheckout,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 30, 138, 226),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  "Check Out",
                  style: TextStyle(color: Colors.black),
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
