import 'package:flutter/material.dart';
// Import halaman EditInfoScreen, PradminScreen, dan KelrebiScreen
import 'editinfo_screen.dart';
import 'pradmin_screen.dart';
import 'kelrebi_screen.dart';
import 'kelpen_screen.dart';

class MmpengelolaScreen extends StatefulWidget {
  const MmpengelolaScreen({super.key});

  @override
  State<MmpengelolaScreen> createState() => _MmpengelolaScreenState();
}

class _MmpengelolaScreenState extends State<MmpengelolaScreen> {
  int _selectedIndex = 0; // Indeks default ke tab "Info"

  // Fungsi untuk menangani perubahan tab
  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const EditinfoScreen()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const KelrebiScreen()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const KelpenScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(129, 212, 105, 1.000),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.person, color: Colors.black),
          onPressed: () {
            // Navigasi ke halaman PradminScreen ketika ikon profile di kiri atas diklik
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PradminScreen()),
            );
          },
        ),
        title: const Text(
          'TAHURA EXPLORE HUB',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: const Text(
          "Selamat Datang di TAHURA Explore Hub",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black54,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          _onItemTapped(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bike),
            label: 'ReBi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'User',
          ),
        ],
      ),
    );
  }
}
