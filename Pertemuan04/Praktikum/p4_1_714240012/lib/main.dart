import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Tempat Wisata Bandung',
      home: const DeltaScreen(),
      );
  }
}

class DeltaScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: const Text(
                  'Ranca Upas',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30.0 , 
                  fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                        children: [ const
                          Icon(Icons.calendar_today),
                          SizedBox(height: 8.0),
                          Text('Open Evertday'),
                        ],
                    ),

                    Column(
                      
                        children: [ const
                          Icon(Icons.access_time),
                          SizedBox(height: 8.0),
                          Text('09.00-20.00'),
                        ],
                    ),

                    Column(
                        children: [ const
                          Icon(Icons.monetization_on),
                          SizedBox(height: 8.0),
                          Text('Rp.20.000'),
                        ],
                    ),
                  ],
                ),
              ),  
              Container(
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  'Ranca Upas Ciwidey adalah kawasan bumi perkemahan di bawah pengelolaanperhutani. Tempat ini berada di kawasan wisata Bandung Selatan, satu lokasidengan kawah putih, kolam Cimanggu dan situ Patenggang. Banyak hal yangbisa dilakukan di kawasan wisata ini, seperti berkemah, berinteraksi denganrusa, sampai bermain di water park dan mandi air panas ',
                  textAlign: TextAlign.justify,
 style: TextStyle(fontSize: 16.0),)
                  
              ),
              
          ],
        ),
      ),
    );

  }
}