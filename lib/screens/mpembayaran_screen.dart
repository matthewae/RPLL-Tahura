import 'package:flutter/material.dart';
import 'cashpay_screen.dart';
import 'viracc_screens.dart'; // Import ViraccScreen
import 'profile_screen.dart'; // Import the ProfileScreen

class MpembayaranScreen extends StatefulWidget {
  const MpembayaranScreen({super.key});

  @override
  _MpembayaranScreenState createState() => _MpembayaranScreenState();
}

class _MpembayaranScreenState extends State<MpembayaranScreen> {
  String _selectedPaymentMethod = "Cash"; // Default selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background to white
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(129, 212, 105, 1.000),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: IconButton(
            icon: const CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1534528740805-52a86510e3f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHxlbnwwfHwyMDI2fDIwNjI2MA&auto=format&fit=crop&w=500&q=60',
              ),
            ),
            onPressed: () {
              // Navigate to the ProfileScreen when the profile icon is clicked
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'Metode Pembayaran',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 30),
          RadioListTile(
            title: const Text('Cash'),
            value: "Cash",
            groupValue: _selectedPaymentMethod,
            onChanged: (value) {
              setState(() {
                _selectedPaymentMethod = value!;
              });
            },
          ),
          RadioListTile(
            title: const Text('Qris/E-money'),
            value: "Qris/E-money",
            groupValue: _selectedPaymentMethod,
            onChanged: (value) {
              setState(() {
                _selectedPaymentMethod = value!;
              });
            },
          ),
          const Spacer(), // Push the button to the bottom of the screen
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0),
            child: ElevatedButton(
              onPressed: () {
                // Logic for navigation
                if (_selectedPaymentMethod == "Cash") {
                  // Navigate to CashpayScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CashpayScreen()),
                  );
                } else {
                  // Navigate to ViraccScreen for Qris/E-money
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ViraccScreen()),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue[100],
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text(
                'Confirm Pembayaran',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
