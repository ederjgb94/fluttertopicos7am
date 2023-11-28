import 'package:flutter/material.dart';
import 'package:prueba1/controladores/carrito_controller.dart';
import 'package:prueba1/utils/producto_info.dart';
import 'package:prueba1/widgets/productoItem.dart';

class CarritoView extends StatefulWidget {
  const CarritoView({super.key});

  @override
  CarritoViewState createState() => CarritoViewState();
}

class CarritoViewState extends State<CarritoView> {
  final TextEditingController _controller = TextEditingController();
  final CarritoController _carritoController = CarritoController();
  List<ProductoItem> productos = [];

  void eliminarProducto(ProductoItem productoItem) {
    setState(() {
      productos.remove(productoItem);
    });
  }

  @override
  void initState() {
    // productos = List.generate(
    //   30,
    //   (index) => ProductoItem(
    //     productoInfo: ProductoInfo(
    //       nombre: 'Producto $index',
    //       precio: 'Precio $index',
    //       cantidad: 1,
    //     ),
    //     eliminarProducto: eliminarProducto,
    //   ),
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // productos = _carritoController.productos
    //     .map((producto) => ProductoItem(
    //         productoInfo: ProductoInfo(nombre: producto['nombre'], precio: ''),
    //         eliminarProducto: eliminarProducto))
    //     .toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito'),
        actions: [
          IconButton(
            onPressed: () {
              for (var producto in productos) {
                print(producto.productoInfo.cantidad);
              }
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  suffix: IconButton(
                    onPressed: () {
                      String codigo = _controller.text;
                      _carritoController.agregarProducto(
                        codigo,
                        productos,
                        eliminarProducto,
                      );
                      setState(() {});
                    },
                    icon: const Icon(Icons.search),
                  ),
                  labelText: 'Ingresa el código del producto',
                ),
              ),
            ),
            for (var producto in productos) producto,
          ],
        ),
      ),
    );
  }
}
