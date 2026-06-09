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
      home: const PantallaBienvenida(),
    );
  }
}

class PantallaBienvenida extends StatefulWidget {
  const PantallaBienvenida({super.key});
  @override
  State<PantallaBienvenida> createState() => _PantallaBienvenidaState();
}

class _PantallaBienvenidaState extends State<PantallaBienvenida> {
  String? lenguaElegida;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B5E20),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.language, size: 90, color: Colors.white),
              const SizedBox(height: 16),
              const Text('Tonalli', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 4)),
              const SizedBox(height: 8),
              const Text('Preservando las voces de Oaxaca', style: TextStyle(fontSize: 15, color: Colors.white70, fontStyle: FontStyle.italic)),
              const SizedBox(height: 50),
              const Text('Elige tu lengua:', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              _LenguaCard(
                nombre: 'Zapoteco',
                region: 'Valle Central de Oaxaca',
                icono: '🌽',
                seleccionada: lenguaElegida == 'zapoteco',
                onTap: () => setState(() => lenguaElegida = 'zapoteco'),
              ),
              const SizedBox(height: 12),
              _LenguaCard(
                nombre: 'Chinanteco',
                region: 'Chinantla — Ojitlan',
                icono: '🌿',
                seleccionada: lenguaElegida == 'chinanteco',
                onTap: () => setState(() => lenguaElegida = 'chinanteco'),
              ),
              const SizedBox(height: 12),
              _LenguaCard(
                nombre: 'Mixteco',
                region: 'La Mixteca Oaxaquena',
                icono: '🏔️',
                seleccionada: lenguaElegida == 'mixteco',
                onTap: () => setState(() => lenguaElegida = 'mixteco'),
              ),
              const SizedBox(height: 40),
              if (lenguaElegida != null)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => PantallaHome(lengua: lenguaElegida!))),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: const Color(0xFF1B5E20), padding: const EdgeInsets.symmetric(vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                    child: Text('Continuar con ${lenguaElegida![0].toUpperCase()}${lenguaElegida!.substring(1)}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LenguaCard extends StatelessWidget {
  final String nombre;
  final String region;
  final String icono;
  final bool seleccionada;
  final VoidCallback onTap;

  const _LenguaCard({required this.nombre, required this.region, required this.icono, required this.seleccionada, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: seleccionada ? Colors.white : Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: seleccionada ? Colors.white : Colors.transparent, width: 2),
        ),
        child: Row(
          children: [
            Text(icono, style: const TextStyle(fontSize: 36)),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(nombre, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: seleccionada ? const Color(0xFF1B5E20) : Colors.white)),
                  Text(region, style: TextStyle(fontSize: 13, color: seleccionada ? Colors.grey[600] : Colors.white70)),
                ],
              ),
            ),
            if (seleccionada) const Icon(Icons.check_circle, color: Color(0xFF1B5E20), size: 28),
          ],
        ),
      ),
    );
  }
}

class PantallaHome extends StatelessWidget {
  final String lengua;
  const PantallaHome({super.key, required this.lengua});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B5E20),
        title: const Text('Tonalli', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.swap_horiz, color: Colors.white),
            onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const PantallaBienvenida())),
            tooltip: 'Cambiar lengua',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text('Bienvenido', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1B5E20))),
            Text('Aprendiendo: ${lengua[0].toUpperCase()}${lengua.substring(1)}', style: const TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 30),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _ModuloCard(icono: Icons.mic, titulo: 'Grabar', subtitulo: 'Preserva tu voz', color: const Color(0xFF2E7D32), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PantallaGrabar()))),
                  _ModuloCard(icono: Icons.menu_book, titulo: 'Aprender', subtitulo: 'Lecciones interactivas', color: const Color(0xFF1565C0), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PantallaAprender(lenguaInicial: lengua)))),
                  _ModuloCard(icono: Icons.translate, titulo: 'Traducir', subtitulo: 'Espanol a lengua', color: const Color(0xFF6A1B9A), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PantallaTraducir(lenguaInicial: lengua)))),
                  _ModuloCard(icono: Icons.person, titulo: 'Perfil', subtitulo: 'Tu progreso', color: const Color(0xFFE65100), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PantallaPerfil(lengua: lengua)))),
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

class PantallaGrabar extends StatefulWidget {
  const PantallaGrabar({super.key});
  @override
  State<PantallaGrabar> createState() => _PantallaGrabarState();
}

class _PantallaGrabarState extends State<PantallaGrabar> {
  bool grabando = false;
  List<String> grabaciones = [];
  final TextEditingController _palabraController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(backgroundColor: const Color(0xFF2E7D32), title: const Text('Grabar Palabra', style: TextStyle(color: Colors.white)), iconTheme: const IconThemeData(color: Colors.white)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text('Escribe la palabra en tu lengua:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            TextField(controller: _palabraController, decoration: InputDecoration(hintText: 'Ej: Guela (abuela en zapoteco)', border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)), filled: true, fillColor: Colors.white)),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                setState(() { grabando = !grabando; });
                if (!grabando && _palabraController.text.isNotEmpty) {
                  setState(() { grabaciones.add(_palabraController.text); _palabraController.clear(); });
                }
              },
              child: Container(
                width: 120, height: 120,
                decoration: BoxDecoration(color: grabando ? Colors.red : const Color(0xFF2E7D32), shape: BoxShape.circle, boxShadow: [BoxShadow(color: (grabando ? Colors.red : const Color(0xFF2E7D32)).withOpacity(0.4), blurRadius: 20, spreadRadius: 5)]),
                child: Icon(grabando ? Icons.stop : Icons.mic, size: 60, color: Colors.white),
              ),
            ),
            const SizedBox(height: 12),
            Text(grabando ? 'Grabando... toca para detener' : 'Toca para grabar', style: TextStyle(fontSize: 14, color: grabando ? Colors.red : Colors.grey)),
            const SizedBox(height: 30),
            if (grabaciones.isNotEmpty) ...[
              const Text('Palabras grabadas:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Expanded(child: ListView.builder(itemCount: grabaciones.length, itemBuilder: (context, index) => Card(child: ListTile(leading: const Icon(Icons.mic, color: Color(0xFF2E7D32)), title: Text(grabaciones[index]), trailing: const Icon(Icons.play_arrow, color: Color(0xFF2E7D32)))))),
            ],
          ],
        ),
      ),
    );
  }
}

class PantallaAprender extends StatefulWidget {
  final String lenguaInicial;
  const PantallaAprender({super.key, required this.lenguaInicial});
  @override
  State<PantallaAprender> createState() => _PantallaAprenderState();
}

class _PantallaAprenderState extends State<PantallaAprender> {
  late String lenguaSeleccionada;

  final Map<String, List<Map<String, String>>> lecciones = {
    'zapoteco': [
      {'palabra': 'Guela', 'traduccion': 'Abuela'}, {'palabra': 'Guelo', 'traduccion': 'Abuelo'},
      {'palabra': 'Beu', 'traduccion': 'Luna'}, {'palabra': 'Niza', 'traduccion': 'Agua'},
      {'palabra': 'Yaa', 'traduccion': 'Arbol'}, {'palabra': 'Bia', 'traduccion': 'Fuego'},
      {'palabra': 'Yoo', 'traduccion': 'Casa'}, {'palabra': 'Guie', 'traduccion': 'Flor'},
      {'palabra': 'Pia', 'traduccion': 'Maiz'}, {'palabra': 'Tobi', 'traduccion': 'Uno'},
    ],
    'chinanteco': [
      {'palabra': 'Ha', 'traduccion': 'Agua'}, {'palabra': 'Tyi', 'traduccion': 'Fuego'},
      {'palabra': 'Na', 'traduccion': 'Casa'}, {'palabra': 'Shi', 'traduccion': 'Luna'},
      {'palabra': 'Ngu', 'traduccion': 'Tierra'}, {'palabra': 'Na-hna', 'traduccion': 'Madre'},
      {'palabra': 'Tya', 'traduccion': 'Padre'}, {'palabra': 'Ndu', 'traduccion': 'Arbol'},
      {'palabra': 'Ku', 'traduccion': 'Mano'}, {'palabra': 'Hna', 'traduccion': 'Cabeza'},
    ],
    'mixteco': [
      {'palabra': 'Yuku', 'traduccion': 'Monte'}, {'palabra': 'Nduta', 'traduccion': 'Agua'},
      {'palabra': 'Kuu', 'traduccion': 'Serpiente'}, {'palabra': 'Ñuu', 'traduccion': 'Pueblo'},
      {'palabra': 'Viko', 'traduccion': 'Fiesta'}, {'palabra': 'Yutnu', 'traduccion': 'Arbol'},
      {'palabra': 'Ndixi', 'traduccion': 'Beber'}, {'palabra': 'Kiti', 'traduccion': 'Animal'},
      {'palabra': 'Tuku', 'traduccion': 'Pajaro'}, {'palabra': 'Ini', 'traduccion': 'Corazon'},
    ],
  };

  int indice = 0;
  bool mostrarRespuesta = false;
  int correctas = 0;

  @override
  void initState() {
    super.initState();
    lenguaSeleccionada = widget.lenguaInicial;
  }

  @override
  Widget build(BuildContext context) {
    final lista = lecciones[lenguaSeleccionada] ?? lecciones['zapoteco']!;
    final leccion = lista[indice];
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(backgroundColor: const Color(0xFF1565C0), title: const Text('Aprender', style: TextStyle(color: Colors.white)), iconTheme: const IconThemeData(color: Colors.white)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _LenguaBtn(titulo: 'Zapoteco', activa: lenguaSeleccionada == 'zapoteco', onTap: () => setState(() { lenguaSeleccionada = 'zapoteco'; indice = 0; mostrarRespuesta = false; correctas = 0; })),
                const SizedBox(width: 8),
                _LenguaBtn(titulo: 'Chinanteco', activa: lenguaSeleccionada == 'chinanteco', onTap: () => setState(() { lenguaSeleccionada = 'chinanteco'; indice = 0; mostrarRespuesta = false; correctas = 0; })),
                const SizedBox(width: 8),
                _LenguaBtn(titulo: 'Mixteco', activa: lenguaSeleccionada == 'mixteco', onTap: () => setState(() { lenguaSeleccionada = 'mixteco'; indice = 0; mostrarRespuesta = false; correctas = 0; })),
              ],
            ),
            const SizedBox(height: 16),
            LinearProgressIndicator(value: (indice + 1) / lista.length, backgroundColor: Colors.grey[300], valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF1565C0))),
            const SizedBox(height: 8),
            Text('${indice + 1} de ${lista.length}', style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 24),
            Container(
              width: double.infinity, padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(color: const Color(0xFF1565C0), borderRadius: BorderRadius.circular(20)),
              child: Column(children: [
                Text('Palabra en ${lenguaSeleccionada[0].toUpperCase()}${lenguaSeleccionada.substring(1)}:', style: const TextStyle(color: Colors.white70, fontSize: 14)),
                const SizedBox(height: 12),
                Text(leccion['palabra']!, style: const TextStyle(color: Colors.white, fontSize: 42, fontWeight: FontWeight.bold)),
              ]),
            ),
            const SizedBox(height: 24),
            if (!mostrarRespuesta)
              ElevatedButton(
                onPressed: () => setState(() => mostrarRespuesta = true),
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1565C0), foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                child: const Text('Ver traduccion', style: TextStyle(fontSize: 16)),
              )
            else ...[
              Container(
                width: double.infinity, padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.green[50], borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xFF2E7D32))),
                child: Column(children: [const Text('Significa:', style: TextStyle(color: Colors.grey)), const SizedBox(height: 8), Text(leccion['traduccion']!, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF1B5E20)))]),
              ),
              const SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                ElevatedButton.icon(onPressed: () => setState(() { correctas++; mostrarRespuesta = false; if (indice < lista.length - 1) indice++; }), icon: const Icon(Icons.check), label: const Text('Lo sabia'), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF2E7D32), foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
                ElevatedButton.icon(onPressed: () => setState(() { mostrarRespuesta = false; if (indice < lista.length - 1) indice++; }), icon: const Icon(Icons.close), label: const Text('No lo sabia'), style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
              ]),
            ],
            const Spacer(),
            Text('Respuestas correctas: $correctas', style: const TextStyle(fontSize: 16, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

class _LenguaBtn extends StatelessWidget {
  final String titulo;
  final bool activa;
  final VoidCallback onTap;
  const _LenguaBtn({required this.titulo, required this.activa, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(color: activa ? const Color(0xFF1565C0) : Colors.grey[200], borderRadius: BorderRadius.circular(20)),
        child: Text(titulo, style: TextStyle(color: activa ? Colors.white : Colors.grey[700], fontWeight: FontWeight.bold, fontSize: 12)),
      ),
    );
  }
}

class PantallaTraducir extends StatefulWidget {
  final String lenguaInicial;
  const PantallaTraducir({super.key, required this.lenguaInicial});
  @override
  State<PantallaTraducir> createState() => _PantallaTraducirState();
}

class _PantallaTraducirState extends State<PantallaTraducir> {
  final TextEditingController _controller = TextEditingController();
  String resultado = '';
  late String lenguaSeleccionada;

  final Map<String, Map<String, String>> diccionario = {
    'zapoteco': {
      'abuela': 'Guela', 'abuelo': 'Guelo', 'agua': 'Niza', 'luna': 'Beu',
      'arbol': 'Yaa', 'fuego': 'Bia', 'casa': 'Yoo', 'sol': 'Niza Guii',
      'flor': 'Guie', 'maiz': 'Pia', 'perro': 'Bichi', 'gato': 'Mishi',
      'madre': 'Naana', 'padre': 'Taata', 'corazon': 'Nidxaa',
      'mano': 'Gueta', 'cabeza': 'Guixe', 'ojo': 'Bixhe',
      'tierra': 'Guieta', 'piedra': 'Yee', 'tortilla': 'Gueta',
      'uno': 'Tobi', 'dos': 'Chupa', 'tres': 'Chonna',
      'hola': 'Biuzi', 'gracias': 'Diidxa', 'adios': 'Naa dxe',
      'amor': 'Nidxaa', 'paz': 'Guidxi', 'hermano': 'Nii',
    },
    'chinanteco': {
      'agua': 'Ha', 'fuego': 'Tyi', 'casa': 'Na', 'sol': 'Tyi hna',
      'luna': 'Shi', 'tierra': 'Ngu', 'madre': 'Na hna', 'padre': 'Tya',
      'mano': 'Ku', 'ojo': 'Tyi ku', 'cabeza': 'Hna', 'arbol': 'Ndu',
      'flor': 'Tyi ndu', 'maiz': 'Ngu ha', 'perro': 'Tyi chi',
      'pajaro': 'Tyi shi', 'piedra': 'Ngu tyi', 'rio': 'Ha ndu',
      'uno': 'Tyi', 'dos': 'Hna', 'tres': 'Ku',
      'hola': 'Tyi na', 'gracias': 'Na tyi', 'adios': 'Ku na',
      'amor': 'Na shi', 'paz': 'Tyi ma', 'hermano': 'Na ku',
    },
    'mixteco': {
      'agua': 'Nduta', 'fuego': 'Nuu', 'casa': 'Yuu', 'sol': 'Ndi',
      'luna': 'Shi', 'tierra': 'Nuu yuku', 'madre': 'Na', 'padre': 'Tata',
      'mano': 'Nuu', 'cabeza': 'Kini', 'arbol': 'Yutnu', 'flor': 'Nuu viko',
      'maiz': 'Nuu nduta', 'perro': 'Ityi', 'pajaro': 'Tuku',
      'monte': 'Yuku', 'pueblo': 'Nuu', 'fiesta': 'Viko',
      'uno': 'Ini', 'dos': 'Uvi', 'tres': 'Uni',
      'hola': 'Nuu sa', 'gracias': 'Ini kuu', 'adios': 'Kuu sa',
      'corazon': 'Ini', 'amor': 'Ini kuu', 'paz': 'Nuu ini',
    },
  };

  @override
  void initState() {
    super.initState();
    lenguaSeleccionada = widget.lenguaInicial;
  }

  void traducir() {
    final texto = _controller.text.toLowerCase().trim();
    final dict = diccionario[lenguaSeleccionada]!;
    setState(() { resultado = dict[texto] ?? 'Palabra no encontrada en el diccionario'; });
  }

  @override
  Widget build(BuildContext context) {
    final dict = diccionario[lenguaSeleccionada]!;
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(backgroundColor: const Color(0xFF6A1B9A), title: const Text('Traducir', style: TextStyle(color: Colors.white)), iconTheme: const IconThemeData(color: Colors.white)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              _LenguaBtn2(titulo: 'Zapoteco', activa: lenguaSeleccionada == 'zapoteco', onTap: () => setState(() { lenguaSeleccionada = 'zapoteco'; resultado = ''; _controller.clear(); })),
              const SizedBox(width: 8),
              _LenguaBtn2(titulo: 'Chinanteco', activa: lenguaSeleccionada == 'chinanteco', onTap: () => setState(() { lenguaSeleccionada = 'chinanteco'; resultado = ''; _controller.clear(); })),
              const SizedBox(width: 8),
              _LenguaBtn2(titulo: 'Mixteco', activa: lenguaSeleccionada == 'mixteco', onTap: () => setState(() { lenguaSeleccionada = 'mixteco'; resultado = ''; _controller.clear(); })),
            ]),
            const SizedBox(height: 20),
            const Text('Escribe en Espanol:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            TextField(controller: _controller, decoration: InputDecoration(hintText: 'Ej: abuela, agua, luna...', border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)), filled: true, fillColor: Colors.white, suffixIcon: IconButton(icon: const Icon(Icons.translate), onPressed: traducir))),
            const SizedBox(height: 12),
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: traducir, style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF6A1B9A), foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), child: Text('Traducir al ${lenguaSeleccionada[0].toUpperCase()}${lenguaSeleccionada.substring(1)}', style: const TextStyle(fontSize: 16)))),
            const SizedBox(height: 16),
            if (resultado.isNotEmpty) Container(
              width: double.infinity, padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(color: const Color(0xFF6A1B9A), borderRadius: BorderRadius.circular(16)),
              child: Column(children: [Text('En ${lenguaSeleccionada[0].toUpperCase()}${lenguaSeleccionada.substring(1)}:', style: const TextStyle(color: Colors.white70)), const SizedBox(height: 8), Text(resultado, style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold))]),
            ),
            const SizedBox(height: 16),
            const Text('Palabras disponibles:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Expanded(child: SingleChildScrollView(child: Wrap(spacing: 8, runSpacing: 8, children: dict.keys.map((p) => GestureDetector(onTap: () { _controller.text = p; traducir(); }, child: Chip(label: Text(p), backgroundColor: Colors.purple[50]))).toList()))),
          ],
        ),
      ),
    );
  }
}

class _LenguaBtn2 extends StatelessWidget {
  final String titulo;
  final bool activa;
  final VoidCallback onTap;
  const _LenguaBtn2({required this.titulo, required this.activa, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(color: activa ? const Color(0xFF6A1B9A) : Colors.grey[200], borderRadius: BorderRadius.circular(20)),
        child: Text(titulo, style: TextStyle(color: activa ? Colors.white : Colors.grey[700], fontWeight: FontWeight.bold, fontSize: 12)),
      ),
    );
  }
}

class PantallaPerfil extends StatelessWidget {
  final String lengua;
  const PantallaPerfil({super.key, required this.lengua});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(backgroundColor: const Color(0xFFE65100), title: const Text('Mi Perfil', style: TextStyle(color: Colors.white)), iconTheme: const IconThemeData(color: Colors.white)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(radius: 50, backgroundColor: Color(0xFFE65100), child: Icon(Icons.person, size: 60, color: Colors.white)),
            const SizedBox(height: 16),
            const Text('Estudiante Tonalli', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text('Aprendiendo: ${lengua[0].toUpperCase()}${lengua.substring(1)}', style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 30),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              _StatCard(numero: '20', label: 'Palabras\naprendidas', color: const Color(0xFF2E7D32)),
              _StatCard(numero: '5', label: 'Dias de\npractica', color: const Color(0xFF1565C0)),
              _StatCard(numero: '8', label: 'Palabras\ngrabadas', color: const Color(0xFFE65100)),
            ]),
            const SizedBox(height: 30),
            const Align(alignment: Alignment.centerLeft, child: Text('Lenguas en progreso:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
            const SizedBox(height: 12),
            _LenguaProgress(lengua: 'Zapoteco', progreso: 0.5, color: const Color(0xFF2E7D32)),
            _LenguaProgress(lengua: 'Chinanteco', progreso: 0.3, color: const Color(0xFF1565C0)),
            _LenguaProgress(lengua: 'Mixteco', progreso: 0.1, color: const Color(0xFF6A1B9A)),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String numero;
  final String label;
  final Color color;
  const _StatCard({required this.numero, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(16)),
      child: Column(children: [Text(numero, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)), Text(label, style: const TextStyle(fontSize: 11, color: Colors.white70), textAlign: TextAlign.center)]),
    );
  }
}

class _LenguaProgress extends StatelessWidget {
  final String lengua;
  final double progreso;
  final Color color;
  const _LenguaProgress({required this.lengua, required this.progreso, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(lengua, style: const TextStyle(fontWeight: FontWeight.w500)), Text('${(progreso * 100).toInt()}%', style: TextStyle(color: color, fontWeight: FontWeight.bold))]),
          const SizedBox(height: 4),
          LinearProgressIndicator(value: progreso, backgroundColor: Colors.grey[200], valueColor: AlwaysStoppedAnimation<Color>(color), minHeight: 8),
        ],
      ),
    );
  }
}
