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
      theme: ThemeData(
          useMaterial3: true,
          //the theme when changed changes globally
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          fontFamily: 'Poppins'
        ),
      //removing the red debug banner
      debugShowCheckedModeBanner: false,
      home:  HomePage()
    );
  }
}

