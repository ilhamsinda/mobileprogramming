import 'package:flutter/material.dart';
import 'home.dart';

class Modul5 extends StatelessWidget {
  const Modul5({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo ListView.builder',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
