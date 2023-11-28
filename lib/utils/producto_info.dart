class ProductoInfo {
  final String nombre;
  final String precio;
  int cantidad = 1;

  ProductoInfo({
    required this.nombre,
    required this.precio,
    cantidad = 1,
  });

  factory ProductoInfo.fromJson(Map<String, dynamic> json) {
    return ProductoInfo(
        nombre: json['nombre'],
        precio: json['precio'],
        cantidad: json['cantidad']);
  }
}
