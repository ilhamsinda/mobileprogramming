import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Kotak 1 (Merah)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 26.0,
                      vertical: 18.0,
                    ),
                    color: Colors.red,
                    child: const Text(
                      'EMAK',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Kotak 2 (Biru)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 26.0,
                      vertical: 18.0,
                    ),
                    color: Colors.blue,
                    child: const Text(
                      'BAPAK',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Kotak 3 (Hijau)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 26.0,
                      vertical: 18.0,
                    ),
                    color: Colors.green,
                    child: const Text(
                      'ANAK',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
