import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:prueba1/controladores/home_controller.dart';
import 'package:prueba1/modelos/producto_model.dart';
import 'package:prueba1/vistas/carrito_productos.dart';
import 'package:prueba1/vistas/ver_productos.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final HomeController _homeController = HomeController();
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();

  Widget buildMenu() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 22.0,
                ),
                SizedBox(height: 16.0),
                Text(
                  "Hello, John Doe",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.home, size: 20.0, color: Colors.white),
            title: const Text("Home"),
            textColor: Colors.white,
            dense: true,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.verified_user,
                size: 20.0, color: Colors.white),
            title: const Text("Profile"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.monetization_on,
                size: 20.0, color: Colors.white),
            title: const Text("Wallet"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.shopping_cart,
                size: 20.0, color: Colors.white),
            title: const Text("Cart"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading:
                const Icon(Icons.star_border, size: 20.0, color: Colors.white),
            title: const Text("Favorites"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading:
                const Icon(Icons.settings, size: 20.0, color: Colors.white),
            title: const Text("Settings"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      obtenerProductos() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var refProductos = firestore.collection('productos');
    var datos = await refProductos.get();
    var productos = datos.docs;

    for (var producto in productos) {
      print(producto.data());
    }

    productos.map(
      (producto) => Text(
        producto.data()['nombre'],
      ),
    );

    return productos;
  }

  @override
  Widget build(BuildContext context) {
    return SideMenu(
      key: _sideMenuKey,
      menu: buildMenu(),
      type: SideMenuType.shrikNRotate,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              final state = _sideMenuKey.currentState;
              if (state!.isOpened) {
                state.closeSideMenu(); // close side menu
              } else {
                state.openSideMenu(); // open side menu
              }
            },
          ),
          title: Text(
            _homeController.mensaje,
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  _homeController.verProductos(context);
                },
                child: const Text(
                  'Ir a ver productos',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _homeController.guardarProductos(context);
                },
                child: const Text(
                  'Ir a guardar productos',
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red, // foreground
                ),
                onPressed: () {
                  FirebaseFirestore firestore = FirebaseFirestore.instance;
                  var productos = firestore.collection('productos');
                  productos.add({
                    'nombre': 'Producto ${Random().nextInt(100)}',
                    'precio': Random().nextInt(100),
                  });
                },
                child: const Text(
                  'Test FireStore',
                ),
              ),
              ElevatedButton(
                onPressed: obtenerProductos,
                child: const Text('acciona'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CarritoView(),
                    ),
                  );
                },
                child: const Text('Ir al Carrito'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
