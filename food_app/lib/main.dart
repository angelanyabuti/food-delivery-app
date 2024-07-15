import 'package:flutter/material.dart';
import 'package:food_app/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      //removing the red debug banner
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'), 
      home: const HomePage()
    );
  }
}

