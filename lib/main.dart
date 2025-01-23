import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart'; // Importa sqflite_common_ffi
import 'home_screen.dart';

void main() {
  // Inicializa el soporte para FFI (requerido para entornos de escritorio)
  sqfliteFfiInit();
  databaseFactory =
      databaseFactoryFfi; // Asigna la fábrica de bases de datos FFI

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Cookbook Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(), // Asegúrate de que HomeScreen sea constante
    );
  }
}
