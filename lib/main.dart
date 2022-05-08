import 'package:flutter/material.dart';
import 'package:ghmc_minor/Screens/homescreen.dart';

import 'package:firebase_core/firebase_core.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Myapp());
}



class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
     
      
      title: "Monitor and Control App",
      home: Homescreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
