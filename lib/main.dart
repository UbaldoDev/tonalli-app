import 'package:flutter/material.dart';

void main() {
  runApp(const TonalliApp());
}

class TonalliApp extends StatelessWidget {
  const TonalliApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tonalli App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2E7D32)),
        useMaterial3: true,
      ),
      home: const PantallaInicio(),
    );
  }
}

class PantallaInicio extends StatelessWidget {
  const PantallaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B5E20),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.language, size: 100, color: Colors.white),
            const SizedBox(height: 24),
            const Text('Tonalli', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 4)),
            const SizedBox(height: 12),
            const Text('Lenguas indigenas de Oaxaca', style: TextStyle(fontSize: 16, color: Colors.white70)),
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: const Color(0xFF1B5E20), padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
              child: const Text('Comenzar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
