import 'package:flutter/material.dart';

class FaunaScreen extends StatelessWidget {
  const FaunaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.green[100]!,
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
                      FaunaCard(
                        title: 'Rusa Sambar (Cervus unicolor)',
                        image: 'assets/sambar.jpg',
                        description:
                            'Rusa sambar atau sambar india adalah jenis rusa besar yang umum berhabitat di Asia. Spesies ini memiliki ciri khas tubuh besar dengan warna bulu kecokelatan.',
                      ),
                      SizedBox(height: 16.0),
                      FaunaCard(
                        title: 'Kera Ekor Panjang (Macaca fascicularis)',
                        image: 'assets/monyet.jpg',
                        description:
                            'Monyet pemakan kepiting adalah primata cercopithecine yang berasal dari Asia Tenggara, dikenal sebagai monyet ekor panjang atau cynomolgus.',
                      ),
                      SizedBox(height: 16.0),
                      FaunaCard(
                        title: 'Burung Cucak Kuning (Rubigula dispar)',
                        image: 'assets/burung.jpg',
                        description:
                            'Burung cucak berukuran sedang, endemik di Jawa, Sumatera dan Bali, dikenal dengan warna kuning emas dan tenggorokan merah darah.',
                      ),
                      SizedBox(height: 16.0),
                      FaunaCard(
                        title: 'Ayam Hutan',
                        image: 'assets/ayam.jpg',
                        description:
                            'Ayam hutan adalah leluhur dari ayam peliharaan. Burung ini hidup di hutan dan memiliki bentuk tubuh serta perilaku yang serupa dengan ayam kampung.',
                      ),
                      SizedBox(height: 16.0),
                      FaunaCard(
                        title: 'Burung Kepodang',
                        image: 'assets/kepodang.jpg',
                        description:
                            'Burung berkicau dengan bulu indah, terkenal sebagai burung pesolek. Kepodang sulit dibedakan antara jantan dan betina berdasarkan bentuk fisik.',
                      ),
                      SizedBox(height: 16.0),
                      FaunaCard(
                        title: 'Burung Kutilang',
                        image: 'assets/kutilang.jpg',
                        description:
                            'Kutilang adalah burung pengicau dari suku Pycnonotidae, dikenal dengan bulu di sekitar pantatnya yang berwarna jingga.',
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
    super.key,
    required this.title,
    required this.image,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green[100]!, Colors.green[300]!],
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
