import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prueba1/vistas/ver_productos.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final TextEditingController _controller = TextEditingController();

  void _incrementCounter() {
    _counter++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
        ),
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey.shade50,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DelayedDisplay(
                delay: const Duration(seconds: 1),
                slidingBeginOffset: const Offset(0.0, -0.35),
                child: Image.asset(
                  'assets/70760bf1e88b184bb1bc.png',
                ),
              ),
              const Text(
                'Ingresa tu nombre',
              ),
              TextField(
                controller: _controller,
                onChanged: (cadena) {
                  print(cadena);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  String nombre = _controller.text;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (c) {
                        return VerProductos(
                          nombre: nombre,
                        );
                      },
                    ),
                  );
                },
                child: const Text('Ingresar'),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onLongPress: () {
                  print('Yes');
                },
                child: Container(
                  width: 80,
                  height: 80,
                  color: Colors.yellow,
                  child: const Text(
                    'Gesture Detector',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
