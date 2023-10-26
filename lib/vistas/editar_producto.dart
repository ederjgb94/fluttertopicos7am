import 'package:flutter/material.dart';
import 'package:prueba1/modelos/producto_model.dart';

class EditarProducto extends StatelessWidget {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController precioController = TextEditingController();
  final int index;
  final Producto producto;
  EditarProducto({
    super.key,
    required this.index,
    required this.producto,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar producto'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              TextField(
                controller: nombreController..text = producto.nombre,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nombre',
                ),
                onChanged: (value) {
                  producto.nombre = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: precioController..text = producto.precio.toString(),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Precio',
                ),
                onChanged: (value) {
                  producto.precio = double.parse(value);
                },
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  producto.update(index);
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.save),
                label: const Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
