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
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PantallaHome()));
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: const Color(0xFF1B5E20), padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
              child: const Text('Comenzar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}

class PantallaHome extends StatelessWidget {
  const PantallaHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B5E20),
        title: const Text('Tonalli', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text('Bienvenido', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1B5E20))),
            const Text('¿Que deseas hacer hoy?', style: TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 30),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _ModuloCard(icono: Icons.mic, titulo: 'Grabar', subtitulo: 'Preserva tu voz', color: const Color(0xFF2E7D32), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PantallaGrabar()))),
                  _ModuloCard(icono: Icons.menu_book, titulo: 'Aprender', subtitulo: 'Lecciones interactivas', color: const Color(0xFF1565C0), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PantallaAprender()))),
                  _ModuloCard(icono: Icons.translate, titulo: 'Traducir', subtitulo: 'Espanol a lengua', color: const Color(0xFF6A1B9A), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PantallaTraduccir()))),
                  _ModuloCard(icono: Icons.person, titulo: 'Perfil', subtitulo: 'Tu progreso', color: const Color(0xFFE65100), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PantallaPerfil()))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ModuloCard extends StatelessWidget {
  final IconData icono;
  final String titulo;
  final String subtitulo;
  final Color color;
  final VoidCallback onTap;

  const _ModuloCard({required this.icono, required this.titulo, required this.subtitulo, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icono, size: 60, color: Colors.white),
            const SizedBox(height: 12),
            Text(titulo, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 4),
            Text(subtitulo, style: const TextStyle(fontSize: 12, color: Colors.white70), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

class PantallaGrabar extends StatelessWidget {
  const PantallaGrabar({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFF2E7D32), title: const Text('Grabar', style: TextStyle(color: Colors.white)), iconTheme: const IconThemeData(color: Colors.white)),
      body: const Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.mic, size: 100, color: Color(0xFF2E7D32)), SizedBox(height: 20), Text('Modulo de Grabacion', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)), SizedBox(height: 10), Text('Aqui podras grabar palabras\nen tu lengua indigena', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.grey))])),
    );
  }
}

class PantallaAprender extends StatelessWidget {
  const PantallaAprender({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFF1565C0), title: const Text('Aprender', style: TextStyle(color: Colors.white)), iconTheme: const IconThemeData(color: Colors.white)),
      body: const Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.menu_book, size: 100, color: Color(0xFF1565C0)), SizedBox(height: 20), Text('Modulo de Aprendizaje', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)), SizedBox(height: 10), Text('Lecciones interactivas\npara aprender tu lengua', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.grey))])),
    );
  }
}

class PantallaTraduccir extends StatelessWidget {
  const PantallaTraduccir({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFF6A1B9A), title: const Text('Traducir', style: TextStyle(color: Colors.white)), iconTheme: const IconThemeData(color: Colors.white)),
      body: const Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.translate, size: 100, color: Color(0xFF6A1B9A)), SizedBox(height: 20), Text('Modulo de Traduccion', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)), SizedBox(height: 10), Text('Traduce entre espanol\ny lenguas indigenas', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.grey))])),
    );
  }
}

class PantallaPerfil extends StatelessWidget {
  const PantallaPerfil({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFFE65100), title: const Text('Perfil', style: TextStyle(color: Colors.white)), iconTheme: const IconThemeData(color: Colors.white)),
      body: const Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.person, size: 100, color: Color(0xFFE65100)), SizedBox(height: 20), Text('Tu Perfil', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)), SizedBox(height: 10), Text('Aqui veras tu progreso\ny logros obtenidos', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.grey))])),
    );
  }
}
