import 'package:flutter/material.dart';
import 'package:prueba1/modelos/producto_model.dart';
import 'package:prueba1/vistas/editar_producto.dart';

class VerProductosController {
  List<Producto> getAll() {
    return Producto.getAll();
  }

  Future<void> editarProducto(context, Producto producto, int index) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditarProducto(
          producto: producto,
          index: index,
        ),
      ),
    );
  }

  void eliminarProducto(int index) {
    Producto.delete(index);
  }
}
