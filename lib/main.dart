import 'package:flutter/material.dart';
import 'package:myapp/screens/cashpay_screen.dart';
import 'package:myapp/screens/detailrebi_screen.dart';
import 'package:myapp/screens/CHrebi_screen.dart';
import 'package:myapp/screens/epay_screen.dart';
import 'package:myapp/screens/main_screen.dart';
import 'package:myapp/screens/profile_screen.dart';
import 'package:myapp/screens/signin_screen.dart';
import 'package:myapp/screens/password_screen.dart';
import 'package:myapp/screens/exitnotif_screen.dart';
import 'package:myapp/screens/mpembayaran_screen.dart';
import 'package:myapp/screens/detailrebi_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  DetailrebiScreen(), // Use ProfilePage here
    );
  }
}
