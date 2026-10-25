import 'package:flutter/material.dart';
import 'modul5/main.dart' as modul5;
import 'modul6/main.dart' as modul6;
import 'modul7/main.dart' as modul7;
import 'modul8/main.dart' as modul8;
import 'modul9/main.dart' as modul9;
import 'modul10/main.dart' as modul10;
import 'uts/main.dart' as uts;
import 'utsprak/main.dart' as utsprak;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pertemuan 01',
      home: MenuUtama(),
    );
  }
}

class MenuUtama extends StatelessWidget {
  const MenuUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Utama - Pertemuan 01'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SizedBox(height: 10),
          _buildModulButton(
            context,
            label: 'Modul 5 - ListView.builder & API',
            destination: const modul5.Modul5(),
          ),
          const SizedBox(height: 12),
          _buildModulButton(
            context,
            label: 'Modul 6 - Pemutar Musik (UI)',
            destination: const modul6.Modul6(),
          ),
          const SizedBox(height: 12),
          _buildModulButton(
            context,
            label: 'Modul 7 - Navigation',
            destination: const modul7.Modul7(),
          ),
          const SizedBox(height: 12),
          _buildModulButton(
            context,
            label: 'Modul 8 - Passing Arguments',
            destination: const modul8.Modul8(),
          ),
          const SizedBox(height: 12),
          _buildModulButton(
            context,
            label: 'Modul 9 - Tasbih Digital (StatefulWidget)',
            destination: const modul9.Modul9(),
          ),
          const SizedBox(height: 12),
          _buildModulButton(
            context,
            label: 'Modul 10 - Flutter Game Store',
            destination: const modul10.Modul10(),
          ),
          const SizedBox(height: 12),
          _buildModulButton(
            context,
            label: '🎬 UTS - Mini Movie App',
            destination: const uts.MiniMovieApp(),
          ),
          const SizedBox(height: 12),
          _buildModulButton(
            context,
            label: '🎓 UTS Prak - KampusKita',
            destination: const utsprak.KampusKitaApp(),
          ),
        ],
      ),
    );
  }

  Widget _buildModulButton(
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
