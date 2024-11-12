import 'dart:math';
import 'package:flutter/material.dart';

class CashpayScreen extends StatelessWidget {
  const CashpayScreen({Key? key}) : super(key: key);

  // Function to generate a random code for the bike pickup
  String generateRandomCode() {
    final random = Random();
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    return 'SBSC' +
        List.generate(
            6, (index) => characters[random.nextInt(characters.length)]).join();
  }

  @override
  Widget build(BuildContext context) {
    String generatedCode = generateRandomCode(); // Generate the code

    return Scaffold(
      backgroundColor: Colors.white, // Background white
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Back button
          },
        ),
      ),
      body: Center( // Center the entire column inside the body
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
            crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally
            children: [
              // Title with pyramid style
              Column(
                children: [
                  const Text(
                    'Metode Pembayaran',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5), // Add space between the lines
                  const Text(
                    '(yang menggunakan cash)',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Alert box
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green[100], // Green alert box
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'ALERT',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'LAKUKAN PEMBAYARAN KETIKA PENGAMBILAN SEPEDA',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          // Close alert action
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        ),
                        child: const Text(
                          'OK',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // Kode Pengambilan Sepeda (Generated)
              const Text(
                'KODE PENGAMBILAN SEPEDA',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  generatedCode, // Display the generated code
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 40), // Add space before the button

              // Confirm Payment Button
              ElevatedButton(
                onPressed: () {
                  // Action for confirm payment button
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Pembayaran dengan Cash dipilih'),
                    ),
                  );
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
            ],
          ),
        ),
      ),
    );
  }
}
