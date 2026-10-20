import 'package:flutter/material.dart';
import 'model/tourism_place.dart';



class DetailScreen extends StatelessWidget {
  final TourismPlace place ;

  const DetailScreen({super.key , required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:<Widget> [
            Stack(
              children: <Widget>[
                Image.asset(place.imageAsset),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        color: Colors.white, 
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child:  Text(
                place.name.toUpperCase(), //perubahan
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children:  [
                      Icon(
                        Icons.calendar_today,
                        color: Colors.green,
                        ),
                      SizedBox(height: 8.0),
                      Text(
                        place.openDays.toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                        ),
                        ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: Colors.green,
                        ),
                      SizedBox(height: 8.0),
                      Text(place.openTime.toUpperCase(),
                       style: TextStyle(
                            fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.monetization_on,
                        color: Colors.green,
                        ),
                      SizedBox(height: 8.0),
                      Text(place.ticketPrice.toUpperCase(),
                       style: TextStyle(
                            fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child:  Text(
                place.description,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Color.fromARGB(255, 84, 1, 133)
                  ),
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: place.imageUrls.map((url){
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: AspectRatio(
                        aspectRatio :16 / 9 ,
                        child:Image.network(
                          url,
                          fit: BoxFit.cover,
                          ),
                        ),
                    ),
                   );
                }).toList(),
               ),
            ) 
          ],
        ),
      ),
    );
  }
}

