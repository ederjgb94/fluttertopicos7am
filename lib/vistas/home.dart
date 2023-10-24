import 'dart:io';
import 'dart:math';

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:prueba1/controladores/home_controller.dart';
import 'package:prueba1/vistas/ver_productos.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final HomeController _homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          ],
        ),
      ),
    );
  }
}
