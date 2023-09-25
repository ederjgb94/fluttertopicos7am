import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class VerProductos extends StatelessWidget {
  VerProductos({super.key, required this.nombre});

  final String nombre;

  final List<String> productos = [
    'Producto 1',
    'Producto 2',
    'Producto 3',
    'Producto 4',
    'Producto 5',
    'Producto 6',
    'Producto 7',
    'Producto 8',
    'Producto 9',
    'Producto 10',
  ];

  Future<Box> _abrirCaja() async {
    return await Hive.openBox('myBox');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          nombre,
        ),
        centerTitle: true,
      ),

      body: FutureBuilder(
        future: _abrirCaja(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final Box caja = snapshot.data as Box;
            final List<dynamic> productos =
                caja.get('productos') as List<dynamic>;
            return ListView.builder(
              itemCount: productos.length,
              itemBuilder: (context, index) {
                final Map<String, dynamic> producto =
                    productos[index] as Map<String, dynamic>;

                return ListTile(
                  trailing: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Agregar'),
                  ),
                  leading: const CircleAvatar(
                    child: Icon(Icons.store),
                  ),
                  title: Text(producto['nombre']),
                  subtitle: Text(producto['precio'].toString()),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),

      //Explicar for each explicar otra forma de asignar información en una
      //lista de widgets
      // body: ListView(
      //   children: List.generate(
      //     10,
      //     (index) => ListTile(
      //       trailing: ElevatedButton(
      //         onPressed: () {},
      //         child: const Text('Agregar'),
      //       ),
      //       leading: const CircleAvatar(
      //         child: Icon(
      //           Icons.person,
      //         ),
      //       ),
      //       title: Text('Producto $index'),
      //     ),
      //   ),
      // children: [
      //   for (var producto in productos)
      //     ListTile(
      //       leading: const CircleAvatar(
      //         child: Icon(
      //           Icons.person,
      //         ),
      //       ),
      //       title: Text(
      //         producto,
      //       ),
      //     ),
      // ],
    );
  }
}
