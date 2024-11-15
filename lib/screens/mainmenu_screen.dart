import 'package:flutter/material.dart';
import 'flora_screen.dart';
import 'fauna_screen.dart';
import 'spot_screen.dart';
import 'map_screen.dart';
import 'sepeda_screen.dart'; // Import SepedaScreen

void main() {
  runApp(TahuraApp());
}

class TahuraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainmenuScreen(),
    );
  }
}

class MainmenuScreen extends StatefulWidget {
  @override
  _MainmenuScreenState createState() => _MainmenuScreenState();
}

class _MainmenuScreenState extends State<MainmenuScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Container(), // Placeholder for Info page content
    MapScreen(), // Displays MapScreen when "Map" is selected
    SepedaScreen(), // Displays SepedaScreen when "ReBi" is selected
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Change the Scaffold background to white
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
      body: _selectedIndex == 0
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  CategoryButton(
                    title: 'Flora',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FloraScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  CategoryButton(
                    title: 'Fauna',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FaunaScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  CategoryButton(
                    title: 'Spot',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SpotScreen(),
                        ),
                      );
                    },
                  ),
                  const Spacer(),
                ],
              ),
            )
          : _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
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
            icon: Icon(
              Icons.info_outline,
              color: _selectedIndex == 0 ? Colors.blue : Colors.black,
            ),
            label: 'Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.map,
              color: _selectedIndex == 1 ? Colors.blue : Colors.black,
            ),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.directions_bike,
              color: _selectedIndex == 2 ? Colors.blue : Colors.black,
            ),
            label: 'ReBi',
          ),
        ],
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const CategoryButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16.0),
        backgroundColor: const Color.fromRGBO(129, 212, 105, 1.000), // Green color for buttons
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.grey[300]!),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          const CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1534528740805-52a86510e3f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHxlbnwwfHwyMDI2fDIwNjI2MA&auto=format&fit=crop&w=500&q=60',
            ),
          ),
        ],
      ),
    );
  }
}
