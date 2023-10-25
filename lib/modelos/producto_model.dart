import 'package:hive_flutter/hive_flutter.dart';

class Producto {
  String nombre;
  double precio;

  Producto({
    required this.nombre,
    required this.precio,
  });

  factory Producto.fromJson(Map<dynamic, dynamic> json) {
    return Producto(
      nombre: json['nombre'],
      precio: json['precio'],
    );
  }

  Map<String, dynamic> toJson() => {
        'nombre': nombre,
        'precio': precio,
      };

  @override
  String toString() {
    return 'Producto{nombre: $nombre, precio: $precio}';
  }

  void save() {
    //guardar en Hive
    Hive.box('productos').add(toJson());

    var productos = Hive.box('productos').values.toList();

    print(productos);
  }

  static List<Producto> getAll() {
    var productos = Hive.box('productos').values.toList();
    print(productos);
    return productos.map((p) => Producto.fromJson(p)).toList();
  }
}
