import 'package:flutter/material.dart';

class KelpenScreen extends StatefulWidget {
  const KelpenScreen({Key? key}) : super(key: key);

  @override
  _KelpenScreenState createState() => _KelpenScreenState();
}

class _KelpenScreenState extends State<KelpenScreen> {
  final List<Map<String, String>> pengunjungData = [
    {'username': 'Alice', 'email': 'alice@example.com', 'password': '********'},
    {'username': 'Alex', 'email': 'alex@example.com', 'password': '********'},
    {'username': 'Bob', 'email': 'bob@example.com', 'password': '********'},
    {'username': 'Charlie', 'email': 'charlie@example.com', 'password': '********'},
  ];

  List<Map<String, String>> filteredPengunjungData = [];
  String selectedUsername = '';
  String selectedEmail = '';
  String selectedPassword = '';
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    // Default filter to show all data
    filteredPengunjungData = pengunjungData;
  }

  void _filterPengunjung(String query) {
    setState(() {
      searchQuery = query;
      filteredPengunjungData = pengunjungData.where((data) {
        return data['username']!.toLowerCase().startsWith(query.toLowerCase());
      }).toList();
      // Sort filtered data alphabetically by username
      filteredPengunjungData.sort((a, b) => a['username']!.compareTo(b['username']!));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(129, 212, 105, 1.000),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(129, 212, 105, 1.000),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Kelola Pengunjung',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search field
            const Text(
              'Cari Pengunjung:',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 8),
            TextField(
              onChanged: (query) => _filterPengunjung(query),
              decoration: InputDecoration(
                hintText: 'Masukkan username',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Dropdown for filtered usernames
            DropdownButtonFormField<String>(
              value: selectedUsername.isNotEmpty ? selectedUsername : null,
              hint: const Text("Pilih Username"),
              items: filteredPengunjungData.map((data) {
                return DropdownMenuItem<String>(
                  value: data['username'],
                  child: Text(data['username']!),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  final selectedData = pengunjungData.firstWhere((data) => data['username'] == value);
                  selectedUsername = selectedData['username']!;
                  selectedEmail = selectedData['email']!;
                  selectedPassword = selectedData['password']!;
                });
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Display selected user information
            const Text(
              'Username Pengunjung:',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: TextEditingController(text: selectedUsername),
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
              readOnly: true,
            ),
            const SizedBox(height: 16),

            const Text(
              'Email Pengunjung:',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: TextEditingController(text: selectedEmail),
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
              readOnly: true,
            ),
            const SizedBox(height: 16),

            const Text(
              'Password Aplikasi:',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: TextEditingController(text: selectedPassword),
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
              readOnly: true,
            ),
          ],
        ),
      ),
    );
  }
}
