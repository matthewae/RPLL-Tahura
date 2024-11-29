import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'map_screen.dart';
import 'flora_screen.dart';
import 'fauna_screen.dart';
import 'spot_screen.dart';
import 'sepeda_screen.dart'; // Import SepedaScreen

class MainmenuScreen extends StatefulWidget {
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
          // Container(
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage(
          //         'assets/tahura2.png',
          //       ),
          //       fit: BoxFit.contain,
          //        colorFilter: ColorFilter.mode(
          //         Colors.black.withOpacity(0.5), // Mengatur transparansi
          //         BlendMode.darken, // Menggelapkan gambar
          //       ),
          //     ),
          //   ),
          // ),
          Column(
            children: [
              AppBar(
                backgroundColor: Colors.green,
                elevation: 0,
                leading: IconButton(
                  icon: Icon(Icons.account_circle, color: Colors.black),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      ),
                    );
                  },
                ),
                title: Center(
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
                            SizedBox(height: 20),
                            for (var category in categories)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    side: BorderSide(color: Colors.grey[300]!),
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      category,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    trailing: CircleAvatar(
                                      radius: 18,
                                      backgroundImage: NetworkImage(
                                        'https://images.unsplash.com/photo-1534528740805-52a86510e3f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHxlbnwwfHwyMDI2fDIwNjI2MA&auto=format&fit=crop&w=500&q=60',
                                      ),
                                    ),
                                    onTap: () {
                                      if (category == 'Flora') {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => FloraScreen(),
                                          ),
                                        );
                                      } else if (category == 'Fauna') {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => FaunaScreen(),
                                          ),
                                        );
                                      } else if (category == 'Spot') {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => SpotScreen(),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                            Spacer(),
                          ],
                        ),
                      )
                    : _selectedIndex == 1
                        ? MapScreen() // Halaman Map tetap
                        : SepedaScreen(),
               ), // Ganti ReBi dengan SepedaScreen ),
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