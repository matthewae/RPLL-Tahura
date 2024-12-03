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
              Colors.white, // White background
              Colors.green[300]!, // Light green for gradient effect
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
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 32.0),
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
                        description: 'Pohon pinus merkusii adalah jenis pinus yang tumbuh di daerah tropis. Pohon ini memiliki tinggi mencapai 40 meter dan diameter batang hingga 1 meter.',
                      ),
                      SizedBox(height: 16.0),
                      FloraCard(
                        title: 'Teklan',
                        image: 'assets/teklan.jpg',
                        description: 'Teklan atau kayu teklan adalah jenis kayu yang berasal dari pohon teklan (Tectona grandis). Kayu teklan dikenal kuat, tahan lama, dan indah, sehingga sering digunakan untuk membuat furniture, lantai, dan bahan bangunan.',
                      ),
                      SizedBox(height: 16.0),
                      FloraCard(
                        title: 'Bunga bangkai (Amorphophallus titanum)',
                        image: 'assets/titan.jpg',
                        description: 'Bunga bangkai raksasa (Amorphophallus titanum Becc.) adalah tumbuhan dari famili talas-talasan (Araceae) endemik dari Sumatra, Indonesia, yang dikenal sebagai tumbuhan dengan bunga majemuk terbesar di dunia, meskipun catatan menyebutkan bahwa kerabatnya, A. gigas (juga endemik dari Sumatra) dapat menghasilkan bunga setinggi 5 m.',
                      ),
                      SizedBox(height: 16.0),
                      FloraCard(
                        title: 'Anggrek akar (Taeniophyllum sp)',
                        image: 'assets/anggrek.jpg',
                        description: 'Salah satu anggrek yang paling mencuri perhatian bagi para pencinta anggrek ialah anggrek akar atau Taeniophyllum sp. Berbeda dari umumnya, anggrek ini sangat kecil dengan ukuran 1-2 milimeter. Bentuknya yang mini membuat tanaman ini mendapat predikat anggrek terkecil di dunia.',
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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: Colors.green,
          width: 1.0,
        ),
        color: const Color.fromRGBO(129, 212, 105, 1.000), // Green color for cards
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Image.asset(
                image,
                width: 120,
                height: 150,
                fit: BoxFit.cover,
              ),
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
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 12.0,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
