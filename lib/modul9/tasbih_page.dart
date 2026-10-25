import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class TasbihPage extends StatefulWidget {
  const TasbihPage({super.key});

  @override
  State<TasbihPage> createState() => _TasbihPageState();
}

class _TasbihPageState extends State<TasbihPage> {
  late ValueNotifier<double> _valueNotifier;
  late double counter;

  @override
  void initState() {
    super.initState();
    _valueNotifier = ValueNotifier(0.0);
    counter = 0.0;
  }

  @override
  void dispose() {
    _valueNotifier.dispose();
    super.dispose();
  }

  void incrementCounter() {
    setState(() {
      if (counter < 33) {
        counter++;
        _valueNotifier.value = (counter / 33) * 100;
      }
    });
  }

  void resetCounter() {
    setState(() {
      counter = 0.0;
      _valueNotifier.value = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 119, 210, 145),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 119, 210, 145),
        elevation: 0,
        title: const Text(
          'Tasbih Digital',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: resetCounter,
        backgroundColor: Colors.white,
        child: const Icon(Icons.refresh_outlined, color: Colors.green),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final availableHeight = constraints.maxHeight;
          // Sesuaikan ukuran elemen berdasarkan tinggi layar yang tersedia
          final progressSize = (availableHeight * 0.42).clamp(180.0, 300.0);
          final fingerprintSize = (availableHeight * 0.17).clamp(80.0, 125.0);
          final counterFontSize = (availableHeight * 0.12).clamp(40.0, 80.0);
          final spacing1 = (availableHeight * 0.02).clamp(8.0, 20.0);
          final spacing2 = (availableHeight * 0.05).clamp(12.0, 40.0);
          final spacing3 = (availableHeight * 0.02).clamp(8.0, 20.0);

          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: availableHeight),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      counter.toInt().toString(),
                      style: TextStyle(
                        fontSize: counterFontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: spacing1),
                    SimpleCircularProgressBar(
                      progressColors: [Colors.amberAccent.shade400],
                      size: progressSize,
                      progressStrokeWidth: 20,
                      backStrokeWidth: 10,
                      mergeMode: true,
                      maxValue: 100,
                      animationDuration: 0,
                      valueNotifier: _valueNotifier,
                    ),
                    SizedBox(height: spacing2),
                    ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(50),
                      ),
                      child: InkWell(
                        onTap: incrementCounter,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Icon(
                            Icons.fingerprint,
                            size: fingerprintSize,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: spacing3),
                    Text(
                      counter >= 33
                          ? 'Alhamdulillah! Sudah 33x'
                          : 'Tekan untuk Bertasbih',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
