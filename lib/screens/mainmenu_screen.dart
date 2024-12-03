import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'map_screen.dart';
import 'flora_screen.dart';
import 'fauna_screen.dart';
import 'spot_screen.dart';
import 'detailrebi_screen.dart'; // Import SepedaScreen

class MainmenuScreen extends StatefulWidget {
  const MainmenuScreen({super.key});

  @override
  _MainmenuScreenState createState() => _MainmenuScreenState();
}

class _MainmenuScreenState extends State<MainmenuScreen> {
  final List<String> categories = ['Flora', 'Fauna', 'Spot'];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.green, // Warna latar belakang
          ),
          Column(
            children: [
              AppBar(
                backgroundColor: Colors.green,
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(Icons.account_circle, color: Colors.black),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfileScreen(),
                      ),
                    );
                  },
                ),
                title: const Center(
                  child: Text(
                    'Information About Tahura',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: _selectedIndex == 0
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            for (var category in categories)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  elevation: 3, // Tambahkan bayangan pada card
                                  child: InkWell(
                                    onTap: () {
                                      if (category == 'Flora') {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const FloraScreen(),
                                          ),
                                        );
                                      } else if (category == 'Fauna') {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const FaunaScreen(),
                                          ),
                                        );
                                      } else if (category == 'Spot') {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const SpotScreen(),
                                          ),
                                        );
                                      }
                                    },
                                    child: Row(
                                      children: [
                                        // Bagian gambar/icon
                                        Container(
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            borderRadius: const BorderRadius
                                                    .only(
                                                topLeft: Radius.circular(12),
                                                bottomLeft: Radius.circular(12),
                                              ),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                category == 'Flora'
                                                    ? 'assets/pinus.jpg'
                                                    : category == 'Fauna'
                                                        ? 'assets/rusa.jpg'
                                                        : 'assets/museum.jpg',
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        // Bagian teks
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  category,
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                                Text(
                                                  category == 'Flora'
                                                      ? 'Explore flora collection in Tahura.'
                                                      : category == 'Fauna'
                                                          ? 'Discover various fauna species.'
                                                          : 'Find your favorite spot.',
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        // Ikon panah
                                        const Padding(
                                          padding: EdgeInsets.only(right: 8.0),
                                          child: Icon(Icons.arrow_forward_ios,
                                              size: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            const Spacer(),
                          ],
                        ),
                      )
                    : _selectedIndex == 1
                        ? const MapScreen() // Halaman Map tetap
                        : const DetailrebiScreen(), // Halaman Sepeda
              ),
              BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                currentIndex: _selectedIndex,
                onTap: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.info_outline,
                        color: _selectedIndex == 0 ? Colors.blue : Colors.black),
                    label: 'Info',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.map,
                        color: _selectedIndex == 1 ? Colors.blue : Colors.black),
                    label: 'Map',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.directions_bike,
                        color: _selectedIndex == 2 ? Colors.blue : Colors.black),
                    label: 'ReBi',
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
