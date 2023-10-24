import 'package:assignment_ui/card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.85),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage("assets/images/image_test.jpg"),
                    ),
                    Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 50,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Text(
                  'MONDAY 16',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'TODAY',
                        style: TextStyle(
                          fontSize: 45,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.purple,
                        ),
                      ),
                      Text(
                        '17  18  19  20',
                        style: TextStyle(
                          fontSize: 45,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              card(
                Colors.yellow.shade400,
                ['11', '30', '12', '20'],
                'DESIGN\nMEETING',
                'ALEX      HELENA      NANA',
                false,
              ),SizedBox(height: 20,),
              card(
                Colors.purpleAccent.shade400,
                ['12', '35', '14', '10'],
                'DAILY\nPROJECT',
                'RICHARD      CIRY      +4',
                true,
              ),
              SizedBox(height: 20,),
              card(
                Colors.green.shade400,
                ['15', '00', '16', '30'],
                'WEEKLY\nPLANING',
                'DEN      NANA      MARK',
                false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
