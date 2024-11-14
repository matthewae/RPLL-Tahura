import 'package:flutter/material.dart';
// Import PasswordScreen
import 'password_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Profile Admin',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: PradminScreen(),
    );
  }
}

class PradminScreen extends StatelessWidget {
  final String employeeId = '12345'; // Replace with the actual ID from your database

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
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
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://example.com/profile.jpg'),
            ),
            SizedBox(height: 20),

            // Employee ID Label and Display
            Text(
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
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey),
                ),
                child: Text(
                  employeeId,
                  style: TextStyle(fontSize: 16, color: Colors.black),
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
              child: Text(
                'LOG OUT',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
