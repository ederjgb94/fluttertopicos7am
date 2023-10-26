import 'package:hive_flutter/hive_flutter.dart';
import 'package:prueba1/modelos/producto_model.dart';

class EditarProductoController {
  void editar(Producto producto, int index) {
    producto.update(index);
  }
}
