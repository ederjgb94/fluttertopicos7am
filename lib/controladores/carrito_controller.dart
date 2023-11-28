import 'package:hive_flutter/hive_flutter.dart';
import 'package:prueba1/utils/producto_info.dart';
import 'package:prueba1/widgets/productoItem.dart';

class CarritoController {
  Set<Map<dynamic, dynamic>> productos = {};

  void agregarProducto(String nombre, List<ProductoItem> productosVistas,
      Function(ProductoItem) eliminarProducto) {
    Map<dynamic, dynamic> producto = Hive.box('productos').get(nombre);

    var seagrego = productos.add(producto);
    if (seagrego) {
      productosVistas.add(
        ProductoItem(
          productoInfo: ProductoInfo(
            nombre: producto['nombre'],
            precio: producto['precio'].toString(),
            cantidad: 1,
          ),
          eliminarProducto: eliminarProducto,
        ),
      );
    } else {
      for (var element in productosVistas) {
        if (element.productoInfo.nombre == nombre) {
          element.productoInfo.cantidad++;
        }
      }
    }
  }
}
