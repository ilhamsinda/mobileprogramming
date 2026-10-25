import 'package:flutter/material.dart';
import 'home.dart';

class Modul6 extends StatelessWidget {
  const Modul6({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Modul 6 - Music Player',
      theme: ThemeData.dark(),
      home: const Home(),
    );
  }
}
