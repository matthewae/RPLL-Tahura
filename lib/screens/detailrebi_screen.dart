import 'package:flutter/material.dart';
import 'CHrebi_screen.dart'; // Replace with the correct path.
import 'profile_screen.dart'; // Import ProfileScreen.

class DetailrebiScreen extends StatefulWidget {
  const DetailrebiScreen({super.key});

  @override
  _DetailrebiScreenState createState() => _DetailrebiScreenState();
}

class _DetailrebiScreenState extends State<DetailrebiScreen> {
  // Konstanta
  final List<String> bikeTypes = ['Sepeda 1 Orang', 'Sepeda 2 Orang'];
  final List<String> jamSewaOptions = ['1 Jam', '2 Jam', '3 Jam'];
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
  static const int batasJamOperasi = 16;

  // Variabel
  String? selectedBikeType;
  String? selectedJamSewa;
  String? selectedPengambilanSepeda;
  String? calculatedPengembalianSepeda;
  final totalPenyewaanController = TextEditingController();

  @override
  void dispose() {
    totalPenyewaanController.dispose();
    super.dispose();
  }

  List<String> filteredPengambilanTimes() {
    if (selectedJamSewa == null) return pengambilanTimes;
    int jamSewa = int.parse(selectedJamSewa!.split(' ')[0]);
    int batasJam = batasJamOperasi - jamSewa;

    return pengambilanTimes.where((time) {
      int hour = int.parse(time.split(':')[0]);
      return hour <= batasJam;
    }).toList();
  }

  void calculatePengembalianSepeda() {
    if (selectedJamSewa != null && selectedPengambilanSepeda != null) {
      int jamSewa = int.parse(selectedJamSewa!.split(' ')[0]);
      int startHour = int.parse(selectedPengambilanSepeda!.split(':')[0]);
      int endHour = startHour + jamSewa;

      setState(() {
        calculatedPengembalianSepeda = endHour <= batasJamOperasi
            ? '${endHour.toString().padLeft(2, '0')}:00'
            : 'Melebihi batas waktu (16:00)';
      });
    }
  }

  void calculateTotal() {
    if (selectedJamSewa != null) {
      int jamSewa = int.parse(selectedJamSewa!.split(' ')[0]);
      int totalHarga;

      // Harga berdasarkan jenis sepeda
      if (selectedBikeType == 'Sepeda 1 Orang') {
        totalHarga = jamSewa * 10000; // Rp 10.000 per jam
      } else if (selectedBikeType == 'Sepeda 2 Orang') {
        totalHarga = jamSewa * 15000; // Rp 15.000 per jam
      } else {
        totalHarga = 0;
      }

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
    if (selectedBikeType == null ||
        selectedJamSewa == null ||
        selectedPengambilanSepeda == null) {
      String errorMessage = '';
      if (selectedBikeType == null) {
        errorMessage += 'Pilih jenis sepeda.\n';
      }
      if (selectedJamSewa == null) {
        errorMessage += 'Pilih jumlah jam sewa.\n';
      }
      if (selectedPengambilanSepeda == null) {
        errorMessage += 'Pilih waktu pengambilan.';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage), duration: const Duration(seconds: 3)),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CHrebiScreen(),
          settings: RouteSettings(
            arguments: {
              'bikeType': selectedBikeType,
              'price': totalPenyewaanController.text,
              'jumlahJamSewa': selectedJamSewa,
              'jamPengambilan': selectedPengambilanSepeda,
              'jamPengembalian': calculatedPengembalianSepeda,
            },
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(129, 212, 105, 1.0),
        elevation: 0,
        title: const Text(
          "Pemesanan Sepeda",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/rusa.jpg'), // Replace with your avatar image
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const ProfileScreen()), // Navigate to ProfileScreen
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDropDown(
              "Jenis Sepeda :",
              bikeTypes,
              selectedBikeType,
              (value) {
                setState(() {
                  selectedBikeType = value;
                  totalPenyewaanController.clear(); // Reset total saat jenis sepeda berubah
                });
              },
            ),
            const SizedBox(height: 14),
            _buildDropDown(
              "Jumlah Jam Sewa :",
              jamSewaOptions,
              selectedJamSewa,
              (value) {
                setState(() {
                  selectedJamSewa = value;
                  calculateTotal();
                });
              },
            ),
            const SizedBox(height: 14),
            _buildDropDown(
              "Pengambilan Sepeda :",
              filteredPengambilanTimes(),
              selectedPengambilanSepeda,
              (value) {
                setState(() {
                  selectedPengambilanSepeda = value;
                  calculatePengembalianSepeda();
                });
              },
            ),
            const SizedBox(height: 14),
            Text("Pengembalian Sepeda: ${calculatedPengembalianSepeda ?? '-'}"),
            const SizedBox(height: 14),
            TextField(
              controller: totalPenyewaanController,
              readOnly: true,
              decoration: const InputDecoration(labelText: "Total Penyewaan"),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: validateAndCheckout,
                child: const Text("Check Out"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropDown(
    String label,
    List<String> options,
    String? selectedValue,
    ValueChanged<String?> onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        DropdownButtonFormField<String>(
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
