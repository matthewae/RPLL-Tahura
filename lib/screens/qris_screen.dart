// import 'package:flutter/material.dart';
// import 'package:qr_flutter/qr_flutter.dart';

// class QrisScreen extends StatelessWidget {
//   static const String qrData = 'https://example.com/payment'; // Data QR
//   static const String userImagePath = 'assets/images/user_profile.png'; // Path gambar
//   static const Color appBarColor = Colors.green; // Warna AppBar
//   static const Color backgroundColor = Colors.greenAccent; // Warna latar belakang

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("KONFIRMASI QRIS"),
//         backgroundColor: appBarColor[400],
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: Container(
//         color: backgroundColor[200],
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               _buildProfileImage(),
//               const SizedBox(height: 16.0),
//               _buildTitleText(),
//               const SizedBox(height: 16.0),
//               _buildQrCode(),
//               const SizedBox(height: 16.0),
//               _buildInstructionText(),
//               const SizedBox(height: 20),
//               _buildConfirmButton(context),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Widget untuk menampilkan gambar profil
//   Widget _buildProfileImage() {
//     return CircleAvatar(
//       radius: 40.0,
//       backgroundImage: AssetImage(userImagePath),
//       onBackgroundImageError: (_, __) => const Icon(
//         Icons.person,
//         size: 40,
//         color: Colors.grey,
//       ),
//     );
//   }

//   // Widget untuk teks judul
//   Widget _buildTitleText() {
//     return const Text(
//       'QRIS Payment',
//       style: TextStyle(
//         fontSize: 24,
//         fontWeight: FontWeight.bold,
//       ),
//     );
//   }

//   // Widget untuk menampilkan QR Code
//   Widget _buildQrCode() {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: QrImage(
//         data: qrData,
//         version: QrVersions.auto,
//         size: 200.0,
//         gapless: true,
//         errorStateBuilder: (context, error) {
//           return const Center(
//             child: Text(
//               'Error generating QR Code',
//               textAlign: TextAlign.center,
//               style: TextStyle(color: Colors.red),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   // Widget untuk teks instruksi
//   Widget _buildInstructionText() {
//     return const Text(
//       'Scan for Payment',
//       style: TextStyle(
//         fontSize: 16,
//         fontWeight: FontWeight.w600,
//       ),
//     );
//   }

//   // Widget untuk tombol konfirmasi pembayaran
//   Widget _buildConfirmButton(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Payment Confirmed!')),
//         );
//       },
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.green[600],
//         padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
//       ),
//       child: const Text(
//         'Confirm Payment',
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 16,
//         ),
//       ),
//     );
//   }
// }
