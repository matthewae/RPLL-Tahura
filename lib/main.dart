import 'package:flutter/material.dart';
// import 'package:myapp/screens/cashpay_screen.dart';
// import 'package:myapp/screens/detailrebi_screen.dart';
// import 'package:myapp/screens/CHrebi_screen.dart';
// import 'package:myapp/screens/epay_screen.dart';
// import 'package:myapp/screens/fauna_screen.dart';
// import 'package:myapp/screens/flora_screen.dart';
// import 'package:myapp/screens/forgotpws_screen.dart';
// import 'package:myapp/screens/main_screen.dart';
// import 'package:myapp/screens/profile_screen.dart';
// import 'package:myapp/screens/sepeda_screen.dart';
// import 'package:myapp/screens/signin_screen.dart';
// import 'package:myapp/screens/password_screen.dart';
// import 'package:myapp/screens/exitnotif_screen.dart';
// import 'package:myapp/screens/mpembayaran_screen.dart';
// import 'package:myapp/screens/detailrebi_screen.dart';
// import 'package:myapp/screens/mainmenu_screen.dart';
import 'package:myapp/screens/splash_screen.dart';
// import 'package:myapp/screens/spot_screen.dart';
// import 'package:myapp/screens/qris_screen.dart';
// import 'package:myapp/screens/viracc_screens.dart';

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
      home: const SplashScreen(),
    );
  }
}