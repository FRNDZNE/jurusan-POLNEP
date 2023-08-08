import 'package:flutter/material.dart';
import 'package:jurusan_polnep/jurusan_list.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daftar jurusan POLNEP',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const Scaffold(
        body: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const JurusanList();
  }
}
