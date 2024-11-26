import 'package:flutter/material.dart';

class FaunaScreen extends StatelessWidget {
  const FaunaScreen({Key? key}) : super(key: key);

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
                'FAUNA',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 32.0),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FaunaCard(
                        title: 'Rusa Sambar (Cervus unicolor)',
                        image: 'assets/sambar.jpg',
                        description: 'Rusa sambar atau sambar india adalah jenis rusa besar yang umum berhabitat di Asia. Spesies ini memiliki ciri khas tubuh besar dengan warna bulu kecokelatan.',
                      ),
                      const SizedBox(height: 16.0),
                      FaunaCard(
                        title: 'Kera Ekor Panjang (Macaca fascicularis)',
                        image: 'assets/monyet.jpg',
                        description: 'Monyet pemakan kepiting adalah primata cercopithecine yang berasal dari Asia Tenggara, dikenal sebagai monyet ekor panjang atau cynomolgus.',
                      ),
                      const SizedBox(height: 16.0),
                      FaunaCard(
                        title: 'Burung Cucak Kuning (Rubigula dispar)',
                        image: 'assets/burung.jpg',
                        description: 'Burung cucak berukuran sedang, endemik di Jawa, Sumatera dan Bali, dikenal dengan warna kuning emas dan tenggorokan merah darah.',
                      ),
                      const SizedBox(height: 16.0),
                      FaunaCard(
                        title: 'Ayam Hutan',
                        image: 'assets/ayam.jpg',
                        description: 'Ayam hutan adalah leluhur dari ayam peliharaan. Burung ini hidup di hutan dan memiliki bentuk tubuh serta perilaku yang serupa dengan ayam kampung.',
                      ),
                      const SizedBox(height: 16.0),
                      FaunaCard(
                        title: 'Burung Kepodang',
                        image: 'assets/kepodang.jpg',
                        description: 'Burung berkicau dengan bulu indah, terkenal sebagai burung pesolek. Kepodang sulit dibedakan antara jantan dan betina berdasarkan bentuk fisik.',
                      ),
                      const SizedBox(height: 16.0),
                      FaunaCard(
                        title: 'Burung Kutilang',
                        image: 'assets/kutilang.jpg',
                        description: 'Kutilang adalah burung pengicau dari suku Pycnonotidae, dikenal dengan bulu di sekitar pantatnya yang berwarna jingga.',
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

class FaunaCard extends StatelessWidget {
  final String title;
  final String image;
  final String description;

  const FaunaCard({
    Key? key,
    required this.title,
    required this.image,
    required this.description,
  }) : super(key: key);

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
