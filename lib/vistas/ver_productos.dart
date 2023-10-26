import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:prueba1/controladores/ver_productos_controller.dart';

class VerProductos extends StatefulWidget {
  const VerProductos({
    super.key,
  });

  @override
  State<VerProductos> createState() => _VerProductosState();
}

class _VerProductosState extends State<VerProductos> {
  final VerProductosController _controller = VerProductosController();

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
                  onPressed: () async {
                    await _controller.editarProducto(
                      context,
                      productos[index],
                      index,
                    );

                    /**
                     * Usamos el Future delayed para que la lista se actualice
                     * despues de que se haya cerrado la ventana de editar
                     * y le damos un tiempo de 500 milisegundos
                     * para que no sea tan brusco el cambio
                     */
                    await Future.delayed(
                      const Duration(
                        milliseconds: 200,
                      ),
                    );

                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.edit,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    _controller.eliminarProducto(
                      index,
                    );
                    await Future.delayed(
                      const Duration(
                        milliseconds: 200,
                      ),
                    );

                    setState(() {});
                  },
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
