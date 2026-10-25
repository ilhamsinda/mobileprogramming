import 'package:flutter/material.dart';
import 'view/home.dart';
import 'view/detail.dart';

/// Entry point Modul 10 – Flutter Game Store
class Modul10 extends StatelessWidget {
  const Modul10({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Game Store',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/detail': (context) {
          final gameId =
              ModalRoute.of(context)!.settings.arguments as int;
          return Detail(gameTerpilih: gameId);
        },
      },
    );
  }
}
