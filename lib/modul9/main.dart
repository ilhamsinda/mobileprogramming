import 'package:flutter/material.dart';
import 'counter_page.dart';
import 'like_button_page.dart';
import 'tasbih_page.dart';

class Modul9 extends StatelessWidget {
  const Modul9({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modul 9 – StatefulWidget'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SizedBox(height: 10),
          _buildButton(
            context,
            label: 'Percobaan 1 – Counter App',
            destination: const CounterPage(),
          ),
          const SizedBox(height: 12),
          _buildButton(
            context,
            label: 'Percobaan 2 – Like Button',
            destination: const LikeButtonPage(),
          ),
          const SizedBox(height: 12),
          _buildButton(
            context,
            label: 'Tugas – Tasbih Digital',
            destination: const TasbihPage(),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
    BuildContext context, {
    required String label,
    required Widget destination,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        textStyle: const TextStyle(fontSize: 16),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => destination),
        );
      },
      child: Text(label),
    );
  }
}
