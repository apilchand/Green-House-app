import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:ghmc_minor/circle.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;

  onUpdate1() {
    setState(() {
      value1 = !value1;
    });
  }

  onUpdate2() {
    setState(() {
      value2 = !value2;
    });
  }

  onUpdate3() {
    setState(() {
      value3 = !value3;
    });
  }

late final AnimationController progressController;
  late final Animation<double> tempAnimation;
 late final Animation<double> humidityAnimation;
 late final Animation<double> moistureAnimation;

 DatabaseReference dbref3 =  FirebaseDatabase.instance.ref();
  DatabaseReference dbref = FirebaseDatabase.instance.ref('Temperature');
  DatabaseReference dbref1 = FirebaseDatabase.instance.ref('Humidity');
  DatabaseReference dbref2 = FirebaseDatabase.instance.ref('Moisture');


  

  @override
  void initState() {
    super.initState();
    
      
    

    /*dbref.once().then((DatabaseEvent event) {
      final data1 = event.snapshot.value.toString();
     
      dbref1.once().then((DatabaseEvent event) {
      final data2 = event.snapshot.value.toString();
   
    dbref2.once().then((DatabaseEvent event) {
      
      final data3 = event.snapshot.value.toString();
        
   });
 });
    });

      
      
      */

    dbref.onValue.listen((DatabaseEvent event) {
      final data1 = event.snapshot.value.toString();

      dbref1.onValue.listen((DatabaseEvent event) {
        final data2 = event.snapshot.value.toString();

        dbref2.onValue.listen((DatabaseEvent event) {
          final data3 = event.snapshot.value.toString();
         // print(data3);

          double temp = double.parse(data1);
          double hum = double.parse(data2);
          double mois= double.parse(data3);
        
print(temp);
print(hum);
print(mois);

        _dashboardInit(temp, hum, mois); //to test comment this
        });
      });
       });
   

    //_dashboardInit(temp, hum, mois);
   
print('test');
    //_dashboardInit(30, 90, 65);  //to test
     
    
  }

  Future _dashboardInit(double t, double h, double m) async {
    progressController =AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));
    print(t);

     tempAnimation =
         Tween<double>(begin: -10, end: 30).animate(progressController)
          ..addListener(() {
            setState(() {});
          });

    humidityAnimation =
        Tween<double>(begin: 0, end: h).animate(progressController)
          ..addListener(() {
            setState(() {});
          });

    moistureAnimation =
        Tween<double>(begin: 0, end: m).animate(progressController)
          ..addListener(() {
            setState(() {});
          });

    progressController.forward();
  
  }

 
  @override
  Widget build(BuildContext context) {
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
                  0.0,
                  0.2,
                  0.4,
                  0.7,
                  1
                ]),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: const Color(0xFF701ebd),
              title: const Text(' Green House'),
              titleTextStyle: const TextStyle(
                  fontSize: 40,
                  color: Color.fromARGB(255, 239, 244, 240),
                  fontWeight: FontWeight.bold),
              centerTitle: true,
            ),
            body: Center(
                child: Column(
              children: [
                const SizedBox(height: 50),
                Row(
                  // circle
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CustomPaint(
                      foregroundPainter:
                          CircleProgress(tempAnimation.value, true),
                      child: SizedBox(
                        //container is replaced
                        width: 120,
                        height: 120,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '${tempAnimation.value}',
                                style: const TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                '°C',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 30),
                    CustomPaint(
                      foregroundPainter:
                          CircleProgress(moistureAnimation.value, false),
                      child: SizedBox(
                        width: 120,
                        height: 120,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '${moistureAnimation.value}',
                                style: const TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                '%',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  //text
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text(
                      "Temperature",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 30),
                    Text(
                      "    Moisture   ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomPaint(
                      foregroundPainter:
                          CircleProgress(humidityAnimation.value, false),
                      child: SizedBox(
                        width: 120,
                        height: 120,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '${humidityAnimation.value}',
                                style: const TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                '%',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        "Humidity",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ]),
                const SizedBox(height: 150),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        "Bulb ",
                        style: TextStyle(
                            color: Color.fromARGB(255, 247, 235, 18),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: FloatingActionButton.extended(
                        heroTag: null,
                        icon: value1
                            ? const Icon(Icons.lightbulb)
                            : const Icon(Icons.lightbulb_outline),
                        backgroundColor: value1
                            ? const Color.fromARGB(255, 45, 213, 15)
                            : Colors.black,
                        label: value1 ? const Text("ON") : const Text("OFF"),
                        elevation: 20.00,
                        onPressed: () {
                          onUpdate1();
                          dbref3.update({"bulb": value1}); //signal to on/off bulb
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  //text
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text(
                      "Motor",
                      style: TextStyle(
                          color: Color.fromARGB(255, 247, 235, 18),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 30),
                    Text(
                      "    Fan   ",
                      style: TextStyle(
                          color: Color.fromARGB(255, 247, 235, 18),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                    //button
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: FloatingActionButton.extended(
                          heroTag: null,
                          icon: value2
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                          backgroundColor: value2
                              ? const Color.fromARGB(255, 45, 213, 15)
                              : Colors.black,
                          label: value2 ? const Text("ON") : const Text("OFF"),
                          elevation: 20.00,
                          onPressed: () {
                            onUpdate2();
                            dbref3.update({"motor": value2});
                            // signal to on/off motor
                          },
                        ),
                      ),
                      const SizedBox(width: 50),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: FloatingActionButton.extended(
                          heroTag: null,
                          icon: value3
                              ? const Icon(Icons.play_circle_fill)
                              : const Icon(Icons.pause_circle_filled),
                          backgroundColor: value3
                              ? const Color.fromARGB(255, 45, 213, 15)
                              : Colors.black,
                          label: value3 ? const Text("ON") : const Text("OFF"),
                          elevation: 20.00,
                          onPressed: () {
                            onUpdate3();
                            dbref3.update({"fan": value3}); //signal to on/off fan
                          },
                        ),
                      ),
                    ])
              ],
            )),
          ),
        ));
  }
  /*Future<void> sendData1() async {
   await dbref.set({"bulb": !value1});
  }


  Future<void> sendData2() async {
   await dbref.child().set({"motor": !value2});
  }
  
  Future<void> sendData3() async {
  await  dbref.set({"fan":!value3});
  
Future<void> readData() async {
  final snapshot = await dbref1.get();
   
      
    if (snapshot.exists) {
    print(snapshot.value);
} else {
    print('No data available.');
}*/

}
