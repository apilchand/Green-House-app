import 'package:flutter/material.dart';

import 'package:ghmc_minor/Screens/sensorscreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

Widget textSection = const Padding(
  padding: EdgeInsets.all(32),
  child: Text(
    'Welcome to Your Own Green House',
    style: TextStyle(
        fontWeight: FontWeight.bold, color: Colors.white, fontSize: 50),
    textAlign: TextAlign.center,
    softWrap: true,
  ),
);

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {


    final nextbutton=FloatingActionButton.extended(
                          heroTag: null,
                                                       
                          backgroundColor: const Color.fromARGB(255, 15, 18, 213),
                          label: const Text("Proceed",style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),),
                          elevation: 20.00,
                          onPressed: () {
                             Navigator.push(
                context, MaterialPageRoute(builder: (context) =>  const Dashboard()));
                            
                          },
                        );
   /*  final nextbutton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: const Color.fromARGB(255, 17, 2, 71),
      child: MaterialButton(
          padding: const EdgeInsets.all(15.0),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) =>  const Dashboard()));
          },
          child: const Text(
            'Proceed',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
          )),
    );*/

    return MaterialApp(
      title: 'Green House',
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: <Color>[
                Color(0xFF701ebd),
                Color(0xFF873bcc),
                Color(0xFFfe4a97),
                Color(0xFFe17763),
                Color(0xFF68998c),
              ],
              stops: [
                0.1,
                0.4,
                0.6,
                0.8,
                1

              ]
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 0, 38, 104),
              title: const Text(' Green House'),
              titleTextStyle: const TextStyle(
                  fontSize: 40,
                  color: Color.fromARGB(255, 254, 254, 254),
                  fontWeight: FontWeight.bold),
              centerTitle: true,
            ),
            body: ListView(
              children: [
                Image.asset(
                  'images/img.jpg',
                  width: 600,
                  height: 240,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 60),
                textSection,
                const SizedBox(height: 100),
                nextbutton,
              ],
            )),
      ),
    );
  }
}
