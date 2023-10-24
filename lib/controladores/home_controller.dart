import 'package:flutter/material.dart';
import 'package:prueba1/vistas/guardar_producto.dart';
import 'package:prueba1/vistas/ver_productos.dart';

class HomeController {
  String mensaje = 'Hola mundo';
  void cambiarMensaje() {
    mensaje = 'Saludo 2';
  }

  void verProductos(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VerProductos(),
      ),
    );
  }

  void guardarProductos(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GuardarProducto(),
      ),
    );
  }
}
