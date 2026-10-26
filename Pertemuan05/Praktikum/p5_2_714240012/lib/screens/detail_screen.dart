import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String name;
  final String npm;

  const DetailScreen({super.key, required this.name, required this.npm});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> activities = [
      {
        'image': 'assets/images/activity1.jpg',
        'title': 'Belajar',
        'description':
            'Saya belajar di kampus untuk menambah ilmu, '
            'memahami materi perkuliahan, dan meningkatkan '
            'kemampuan di bidang teknologi informasi.',
      },
      {
        'image': 'assets/images/activity2.jpg',
        'title': 'Hobi',
        'description':
            'Saya senang bermain game di waktu luang '
            'untuk hiburan dan melepas penat setelah '
            'menjalani aktivitas sehari-hari.',
      },
      {
        'image': 'assets/images/activity3.jpg',
        'title': 'Aktivitas',
        'description':
            'Pagi sampai siang saya kuliah di kampus. '
            'Setelah pulang kuliah, saya melanjutkan '
            'aktivitas dengan menjadi driver Shopee '
            'untuk mencari penghasilan tambahan.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Profil',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF536DFE),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.white,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.account_circle,
                          color: Color(0xFF536DFE),
                          size: 30,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Informasi Mahasiswa',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      name,
                      style: const TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF202A44),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'NPM: $npm',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Tentang Saya',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Saya adalah mahasiswa yang tertarik pada '
                      'teknologi informasi dan pengembangan aplikasi. '
                      'Saya senang mempelajari hal baru, mengeksplorasi '
                      'teknologi, dan mengembangkan keterampilan '
                      'pemrograman menggunakan Flutter dan Dart.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.7,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 28),
            const Text(
              'Galeri Aktivitas',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Color(0xFF202A44),
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Beberapa aktivitas dan minat saya',
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  final activity = activities[index];

                  
return Container(
  width: 190,
  margin: const EdgeInsets.only(right: 14),
  child: Card(
    clipBehavior: Clip.antiAlias,
    color: Colors.white,
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(18),
          ),
          child: Image.asset(
            activity['image']!,
            width: double.infinity,
            height: 125,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                activity['title']!,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                activity['description']!,
                softWrap: true,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  ),
);

                  
                },
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text(
                  'Kembali',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF536DFE),
                  side: const BorderSide(color: Color(0xFF536DFE)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
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
