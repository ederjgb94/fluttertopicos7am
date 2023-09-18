import 'package:flutter/material.dart';

class VerProductos extends StatelessWidget {
  VerProductos({super.key, required this.nombre});

  final String nombre;

  final List<String> productos = [
    'Producto 1',
    'Producto 2',
    'Producto 3',
    'Producto 4',
    'Producto 5',
    'Producto 6',
    'Producto 7',
    'Producto 8',
    'Producto 9',
    'Producto 10',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          nombre,
        ),
        centerTitle: true,
      ),
      //Explicar for each explicar otra forma de asignar información en una
      //lista de widgets
      body: ListView(
        children: [
          for (var producto in productos)
            ListTile(
              title: Text(
                producto,
              ),
            ),
        ],
      ),
    );
  }
}
