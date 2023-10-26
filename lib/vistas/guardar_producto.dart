import 'package:flutter/material.dart';
import 'package:prueba1/controladores/guardar_producto_controller.dart';

class GuardarProducto extends StatelessWidget {
  final GuardarProductosController _guardarProductosController =
      GuardarProductosController();
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController precioController = TextEditingController();
  GuardarProducto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Guardar producto')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(
                labelText: 'Nombre',
              ),
            ),
            TextField(
              controller: precioController,
              decoration: const InputDecoration(
                labelText: 'Precio',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String nombre = nombreController.text;
                String precio = precioController.text;

                _guardarProductosController.guardarProducto(
                  nombre: nombre,
                  precio: precio,
                );

                Navigator.pop(context);
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
