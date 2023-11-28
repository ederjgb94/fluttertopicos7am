import 'package:flutter/material.dart';
import 'package:prueba1/modelos/producto_model.dart';
import 'package:prueba1/utils/producto_info.dart';

class ProductoItem extends StatefulWidget {
  final ProductoInfo productoInfo;

  final Function(ProductoItem) eliminarProducto;
  const ProductoItem({
    super.key,
    required this.productoInfo,
    required this.eliminarProducto,
  });

  @override
  State<ProductoItem> createState() => _ProductoItemState();
}

class _ProductoItemState extends State<ProductoItem> {
  ProductoInfo get productoInfo => widget.productoInfo;

  @override
  Widget build(BuildContext context) {
    const double padding = 8;
    const double padd = 4;
    final ProductoInfo c = ProductoInfo(nombre: '', precio: '');

    return ListTile(
      title: Text(productoInfo.nombre),
      subtitle: Text(productoInfo.precio),
      leading: IconButton(
        onPressed: () {
          widget.eliminarProducto(widget);
        },
        icon: const Icon(Icons.delete),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                if (productoInfo.cantidad > 1) {
                  productoInfo.cantidad--;
                }
              });
            },
            icon: const Icon(Icons.remove),
          ),
          Text(productoInfo.cantidad.toString()),
          IconButton(
            onPressed: () {
              setState(() {
                productoInfo.cantidad++;
              });
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
