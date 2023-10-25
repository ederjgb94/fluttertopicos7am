import 'package:flutter/material.dart';
import 'package:prueba1/modelos/producto_model.dart';

class EditarProducto extends StatelessWidget {
  final int index;
  final Producto producto;
  const EditarProducto({
    super.key,
    required this.index,
    required this.producto,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar producto'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Editar producto ${producto.nombre}'),
      ),
    );
  }
}
