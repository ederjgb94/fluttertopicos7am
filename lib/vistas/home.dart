import 'dart:io';
import 'dart:math';

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
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
    int colorrand = Random().nextInt(2);
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
              ElevatedButton(
                onPressed: () async {
                  // var path = Directory.current.path;
                  // Hive.init(path);
                  // Hive.initFlutter();

                  //esta es cuando no esta abierta y la voy a usar
                  var box = await Hive.openBox('myBox');

                  //este escuando ya esta abierta la caja y la voy a usar
                  // var box = Hive.box('myBox');

                  box.put('productos', [
                    {
                      'nombre': 'Coca Cola',
                      'precio': 32.5,
                    },
                    {
                      'nombre': 'Pepsi',
                      'precio': 12.5,
                    },
                    {
                      'nombre': 'Fanta',
                      'precio': 22.5,
                    },
                  ]);

                  var name = box.get('productos');

                  print('Name: $name');
                },
                child: const Text('Testeo Hive'),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: AnimatedContainer(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: colorrand == 0
                        ? Colors.blue
                        : colorrand == 1
                            ? Colors.teal
                            : Colors.pink,
                  ),
                  width: 60 + (Random().nextInt(200) + 0),
                  height: 80,
                  duration: const Duration(
                    milliseconds: 500,
                  ),
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
