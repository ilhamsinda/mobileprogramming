import 'package:flutter/material.dart';

import 'home.dart';
import 'tujuan.dart';

class Modul7 extends StatelessWidget {
  const Modul7({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: '/',

      routes: {
        '/': (context) => const Home(),
        '/tujuan': (context) => const Tujuan(),
      },
    );
  }
}
