import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:prueba1/controladores/ver_productos_controller.dart';

class VerProductos extends StatelessWidget {
  final VerProductosController _controller = VerProductosController();
  VerProductos({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var productos = _controller.getAll();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Ver productos',
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: productos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              productos[index].nombre,
            ),
            subtitle: Text(
              productos[index].precio.toString(),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    _controller.editarProducto(
                      context,
                      productos[index],
                      index,
                    );
                  },
                  icon: const Icon(
                    Icons.edit,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
