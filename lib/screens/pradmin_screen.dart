import 'package:flutter/material.dart';
// Import PasswordScreen
import 'password_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Profile Admin',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const PradminScreen(),
    );
  }
}

class PradminScreen extends StatelessWidget {
  final String employeeId = '12345';

  const PradminScreen({super.key}); // Replace with the actual ID from your database

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(129, 212, 105, 1.000),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(129, 212, 105, 1.000),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Profile Picture
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://example.com/profile.jpg'),
            ),
            const SizedBox(height: 20),

            // Employee ID Label and Display
            const Text(
              'Id Karyawan:',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey),
                ),
                child: Text(
                  employeeId,
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),

            // Logout Button
            ElevatedButton(
              onPressed: () {
                // Navigate to PasswordScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PasswordScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text(
                'LOG OUT',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
