import 'package:flutter/material.dart';

class FloraScreen extends StatelessWidget {
  const FloraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white, // Background atas
              Colors.green[100]!, // Background bawah
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                tooltip: "Back",
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                'FLORA',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FloraCard(
                        title: 'Pinus Merkusii',
                        image: 'assets/pinus.jpg',
                        description:
                            'Pohon pinus merkusii adalah jenis pinus yang tumbuh di daerah tropis. Pohon ini memiliki tinggi mencapai 40 meter dan diameter batang hingga 1 meter.',
                      ),
                      SizedBox(height: 16.0),
                      FloraCard(
                        title: 'Teklan',
                        image: 'assets/teklan.jpg',
                        description:
                            'Teklan atau kayu teklan adalah jenis kayu yang berasal dari pohon teklan (Tectona grandis). Kayu teklan dikenal kuat, tahan lama, dan indah, sehingga sering digunakan untuk membuat furniture, lantai, dan bahan bangunan.',
                      ),
                      SizedBox(height: 16.0),
                      FloraCard(
                        title: 'Bunga bangkai (Amorphophallus titanum)',
                        image: 'assets/titan.jpg',
                        description:
                            'Bunga bangkai raksasa (Amorphophallus titanum Becc.) adalah tumbuhan dari famili talas-talasan (Araceae) endemik dari Sumatra, Indonesia, yang dikenal sebagai tumbuhan dengan bunga majemuk terbesar di dunia.',
                      ),
                      SizedBox(height: 16.0),
                      FloraCard(
                        title: 'Anggrek akar (Taeniophyllum sp)',
                        image: 'assets/anggrek.jpg',
                        description:
                            'Salah satu anggrek yang paling mencuri perhatian bagi para pencinta anggrek ialah anggrek akar atau Taeniophyllum sp. Berbeda dari umumnya, anggrek ini sangat kecil dengan ukuran 1-2 milimeter.',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FloraCard extends StatelessWidget {
  final String title;
  final String image;
  final String description;

  const FloraCard({
    super.key,
    required this.title,
    required this.image,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0, // Menambahkan bayangan untuk efek 3D
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.green[100]!,
              Colors.green[300]!
            ], // Gradient background
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.asset(
                image,
                width: 120,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 12.0),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () {
                          // Fungsi untuk detail lebih lanjut
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(title),
                                content: Text(description),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Tutup'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[700],
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text('Lihat Detail'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
