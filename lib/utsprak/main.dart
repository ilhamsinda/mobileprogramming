import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/events_screen.dart';
import 'screens/organizations_screen.dart';
import 'theme/app_theme.dart';

/// Entry point aplikasi KampusKita.
/// Gunakan KampusKitaApp sebagai widget root dari luar folder utsprak.
class KampusKitaApp extends StatelessWidget {
  const KampusKitaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KampusKita',
      theme: AppTheme.theme,
      home: const _MainShell(),
    );
  }
}

/// Shell navigasi utama dengan BottomNavigationBar.
class _MainShell extends StatefulWidget {
  const _MainShell();

  @override
  State<_MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<_MainShell> {
  int _currentIndex = 0;

  // Daftar halaman utama yang dinavigasi via BottomNavigationBar
  static const List<Widget> _pages = [
    HomeScreen(),
    EventsScreen(),
    OrganizationsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.white,
        indicatorColor: AppTheme.primaryColor.withValues(alpha: 0.12),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded, color: AppTheme.primaryColor),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.event_outlined),
            selectedIcon: Icon(Icons.event_rounded, color: AppTheme.primaryColor),
            label: 'Kegiatan',
          ),
          NavigationDestination(
            icon: Icon(Icons.groups_outlined),
            selectedIcon:
                Icon(Icons.groups_rounded, color: AppTheme.primaryColor),
            label: 'Organisasi',
          ),
        ],
      ),
    );
  }
}
