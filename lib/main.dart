import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:prueba1/vistas/home.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('productos');
  runApp(const MaterialApp(
    home: MyHomePage(
      title: 'Prueba 1',
    ),
  ));
}
