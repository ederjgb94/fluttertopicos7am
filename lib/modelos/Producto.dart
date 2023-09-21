class Producto {
  int codigo;
  String nombre;
  String descripcion;
  double precio;
  String imagen;

  Producto(
      {required this.codigo,
      required this.nombre,
      required this.descripcion,
      required this.precio,
      required this.imagen});

  factory Producto.fromJson(Map<String, dynamic> json) {
    return Producto(
      codigo: json['codigo'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      precio: json['precio'],
      imagen: json['imagen'],
    );
  }

  Map<String, dynamic> toJson() => {
        'codigo': codigo,
        'nombre': nombre,
        'descripcion': descripcion,
        'precio': precio,
        'imagen': imagen,
      };

  @override
  String toString() {
    return 'Producto{codigo: $codigo, nombre: $nombre, descripcion: $descripcion, precio: $precio, imagen: $imagen}';
  }
}
