import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alignment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2563EB),
          brightness: Brightness.light,
        ),
      ),
      home: const AlignmentHomeScreen(),
    );
  }
}

class AlignmentHomeScreen extends StatefulWidget {
  const AlignmentHomeScreen({super.key});

  @override
  State<AlignmentHomeScreen> createState() => _AlignmentHomeScreenState();
}

class _AlignmentHomeScreenState extends State<AlignmentHomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Alignment',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          WeatherTaskView(),
          WidgetShowcaseView(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          selectedItemColor: const Color(0xFF2563EB),
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.wb_sunny_rounded),
              label: 'Tugas Cuaca',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.widgets_rounded),
              label: 'Widget Kustom',
            ),
          ],
        ),
      ),
    );
  }
}

// ----------------------------------------------------
// TUGAS 2.4 - UI CUACA KEREN (WEATHER TASK VIEW)
// ----------------------------------------------------
class WeatherTaskView extends StatelessWidget {
  const WeatherTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF1E3A8A), // Deep Royal Blue
            Color(0xFF3B82F6), // Vibrant Blue
            Color(0xFF93C5FD), // Soft Sky Blue
          ],
        ),
      ),
      child: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10),
                        // Header Kota (Malang)
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(Icons.location_on, color: Colors.amberAccent, size: 24),
                                SizedBox(width: 6),
                                Text(
                                  'Malang',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    letterSpacing: 1.1,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black26,
                                        blurRadius: 8,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Jawa Timur, Indonesia',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white.withValues(alpha: 0.85),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),

                        // Main Weather Display Card (Centered 25°)
                        Container(
                          width: double.infinity,
                          constraints: const BoxConstraints(maxWidth: 320),
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.18),
                            borderRadius: BorderRadius.circular(28),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.3),
                              width: 1.5,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.15),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.wb_sunny_rounded,
                                size: 70,
                                color: Colors.amberAccent,
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                '25°',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 72,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.white,
                                  height: 1.0,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.25),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Text(
                                  'Cerah Berawan',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Forecast Section (Row & Column Implementation)
                        Container(
                          width: double.infinity,
                          constraints: const BoxConstraints(maxWidth: 360),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.92),
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.12),
                                blurRadius: 15,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.calendar_today_rounded, size: 16, color: Color(0xFF1E3A8A)),
                                  SizedBox(width: 8),
                                  Text(
                                    'Prakiraan 3 Hari',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF1E3A8A),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 14),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: const [
                                  WeatherCardItem(
                                    day: 'Minggu',
                                    icon: Icons.sunny,
                                    iconColor: Colors.amber,
                                    temp: '20°C',
                                  ),
                                  WeatherCardItem(
                                    day: 'Senin',
                                    icon: Icons.cloudy_snowing,
                                    iconColor: Colors.blueAccent,
                                    temp: '23°C',
                                  ),
                                  WeatherCardItem(
                                    day: 'Selasa',
                                    icon: Icons.cloud,
                                    iconColor: Colors.blueGrey,
                                    temp: '22°C',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class WeatherCardItem extends StatelessWidget {
  final String day;
  final IconData icon;
  final Color iconColor;
  final String temp;

  const WeatherCardItem({
    super.key,
    required this.day,
    required this.icon,
    required this.iconColor,
    required this.temp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            day,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF475569),
            ),
          ),
          const SizedBox(height: 8),
          Icon(
            icon,
            size: 28,
            color: iconColor,
          ),
          const SizedBox(height: 8),
          Text(
            temp,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F172A),
            ),
          ),
        ],
      ),
    );
  }
}

// ----------------------------------------------------
// PRAKTIKUM - WIDGET SHOWCASE VIEW (LANGKAH 2 & 3)
// ----------------------------------------------------
class WidgetShowcaseView extends StatelessWidget {
  const WidgetShowcaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Text(
              'Showcase Widget Kustom',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Hasil implementasi Langkah 2 & 3 (KotakBiruJempol & KotakBiruJempolKecil)',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 24),

            // Demonstration Card
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Demonstrasi Row & Spacing:',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        KotakBiruJempolKecil(),
                        SizedBox(width: 16),
                        KotakBiruJempol(),
                        SizedBox(width: 16),
                        KotakBiruJempolKecil(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Langkah 2 - Widget Kustom KotakBiruJempol
class KotakBiruJempol extends StatelessWidget {
  const KotakBiruJempol({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(
        Icons.thumb_up,
        color: Colors.white,
        size: 40,
      ),
    );
  }
}

// Langkah 3 - Widget Kustom KotakBiruJempolKecil
class KotakBiruJempolKecil extends StatelessWidget {
  const KotakBiruJempolKecil({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 75,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(
        Icons.thumb_up,
        color: Colors.white,
        size: 40,
      ),
    );
  }
}
