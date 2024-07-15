import 'package:flutter/material.dart';

//creating a stateless widget
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) { //scaffold class in flutter which provides many widgets, eg app bar, drawer, floating action button, bottom navigation bar, snack bar
    return Scaffold(
      appBar: AppBar(
        title: Text('Breakfast', 
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
                ),
                backgroundColor: Colors.amberAccent,
        centerTitle: true,
      ),
    );
  }
}