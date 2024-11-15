import 'package:flutter/material.dart';
// Import halaman EditMapsScreen, EditInfoScreen, PradminScreen, dan KelrebiScreen
import 'editmaps_screen.dart';
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
  int _selectedIndex = 1; // Indeks default ke tab "Map"

  // Fungsi untuk menangani perubahan tab
  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EditinfoScreen()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => KelrebiScreen()),
      );
    } else if (index == 3) {
      // Navigasi ke KelpenScreen ketika tab User di kanan bawah diklik
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => KelpenScreen()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(129, 212, 105, 1.000),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.person, color: Colors.black),
          onPressed: () {
            // Navigasi ke halaman PradminScreen ketika ikon profile di kiri atas diklik
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PradminScreen()),
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
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.black),
            onPressed: () {
              // Navigasi ke halaman EditMapsScreen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EditmapsScreen()),
              );
            },
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          Center(child: Text("Info Screen")), // Placeholder untuk halaman Info
          Center(
            child: Image.asset(
              'assets/tahura_map.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(child: Text("ReBi Screen")), // Placeholder untuk halaman ReBi
          Center(child: Text("User Screen")), // Placeholder untuk halaman User
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black54,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
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
