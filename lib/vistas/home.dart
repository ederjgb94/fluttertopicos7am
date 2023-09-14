import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:prueba1/vistas/ver_productos.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

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
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: _counter < 10
                    ? null
                    : _counter < 20
                        ? const TextStyle(
                            fontSize: 30,
                          )
                        : const TextStyle(
                            fontSize: 50,
                          ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (c) {
                        return VerProductos();
                      },
                    ),
                  );
                },
                child: const Text('Hola'),
              ),
              const TextField(),
              DelayedDisplay(
                delay: const Duration(seconds: 1),
                slidingBeginOffset: const Offset(0.0, -0.35),
                child: Image.asset(
                  'assets/70760bf1e88b184bb1bc.png',
                  width: 300,
                  height: 300,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: ElevatedButton(
        onPressed: () {
          setState(() {});
        },
        child: const Text('Hola'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
