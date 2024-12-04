import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'map_screen.dart';
import 'flora_screen.dart';
import 'fauna_screen.dart';
import 'spot_screen.dart';
import 'detailrebi_screen.dart';

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
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          // Background Container
          Container(
            color: Colors.green[300]!,
          ),
          // Main Content
          Column(
            children: [
              AppBar(
                backgroundColor: Colors.green[300]!,
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
              // Only show content when Info tab is selected
              if (_selectedIndex == 0)
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          for (var category in categories)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                elevation: 5,
                                clipBehavior: Clip.antiAlias,
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
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 150,
                                        decoration: BoxDecoration(
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
                                      Container(
                                        height: 150,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.black.withOpacity(0.5),
                                              Colors.transparent,
                                            ],
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 16,
                                        left: 16,
                                        right: 16,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              category,
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
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
                                                color: Colors.white70,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
          // MapScreen and DetailrebiScreen
          if (_selectedIndex == 1)
            Positioned.fill(
              child: const MapScreen(), // Display MapScreen when selected
            ),
          if (_selectedIndex == 2)
            Positioned.fill(
              child:
                  const DetailrebiScreen(), // Display DetailrebiScreen when selected
            ),
          // Bottom Navigation Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomNavigationBar(
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
          ),
        ],
      ),
    );
  }
}
