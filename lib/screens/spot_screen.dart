import 'package:flutter/material.dart';

class SpotScreen extends StatelessWidget {
  const SpotScreen({super.key});

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
                'SPOT',
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
                      SpotCard(
                        title: 'Goa Belanda',
                        image: 'assets/belanda.jpg',
                        description:
                            'Pada masa penjajahan Belanda, Belanda membangun berbagai infrastruktur di berbagai wilayah, termasuk di Kota Bandung. Salah satunya adalah pembangunan gua-gua buatan manusia. Gua Belanda dibangun pada tahun 1923 sebagai tempat penyimpanan dan perlindungan saat terjadi serangan udara atau serangan musuh.',
                      ),
                      SizedBox(height: 16.0),
                      SpotCard(
                        title: 'Goa Jepang',
                        image: 'assets/jepang.jpg',
                        description:
                            'Goa Jepang adalah salah satu tempat bersejarah yang dibangun oleh Jepang selama Perang Dunia II. Goa ini digunakan sebagai tempat pertahanan dan penyimpanan amunisi.',
                      ),
                      SizedBox(height: 16.0),
                      SpotCard(
                        title: 'Penangkaran Rusa',
                        image: 'assets/rusa.jpg',
                        description:
                            'Penangkaran Rusa adalah tempat yang didedikasikan untuk melindungi dan melestarikan spesies rusa yang terancam punah.',
                      ),
                      SizedBox(height: 16.0),
                      SpotCard(
                        title: 'Curug Omas',
                        image: 'assets/omas.jpg',
                        description: 'Curug Omas merupakan air terjun yang memiliki ketinggian mencapai 30 meter dengan kedalaman air mencapai 10 meter di Tahura Djuanda. Curug Omas merupakan sebuah titik pertemuan dari dua aliran sungai yaitu sungai Cikawari dan sungai Cigulun.',
                      ),
                      SizedBox(height: 16.0),
                      SpotCard(
                        title: 'Batu Selendang Dayang',
                        image: 'assets/batik.jpg',
                        description: 'Batu mirip corak batik itu hanya berada di Indonesia dan teksturnya mirip batu di Hawaii. Pengelola Tahura Djuanda telah memperbaiki akses jalan menuju Batu Selendang Dayang Sumbi sehingga saat ini pengunjung dapat melakukan swafoto di akses jalan tersebut.',
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

class SpotCard extends StatelessWidget {
  final String title;
  final String image;
  final String description;

  const SpotCard({
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
