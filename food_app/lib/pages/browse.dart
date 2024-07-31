import 'package:flutter/material.dart';

class BrowsePage extends StatelessWidget {
  const BrowsePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Browse')),
      body: Center(child: Text('Browse Page')),

    );
    
  }
}