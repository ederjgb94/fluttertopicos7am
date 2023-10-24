import 'package:prueba1/modelos/Producto_model.dart';

class GuardarProductosController {
  void guardarProducto({
    required String nombre,
    required String precio,
  }) {
    //validar el precio [quedó pendiente]
    //mediante try catch ó regex (mejor regex)

    Producto producto = Producto(
      nombre: nombre,
      precio: double.parse(precio),
    );

    producto.save();
  }
}
