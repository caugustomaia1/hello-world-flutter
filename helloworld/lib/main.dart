import 'package:flutter/material.dart';
import 'dart:io' as io;

import 'package:helloworld/Formulario.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
      ),
      home: const MyHomePage(title: 'Taxi Machine onboarding'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _fecharApp() {
    io.exit(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 212, 192, 13),
        title: Text(widget.title),
        actions: [TextButton(onPressed: _fecharApp, child: Text("X"))],
      ),
      body: Padding(padding: const EdgeInsets.all(16.0), child: Formulario()),
    );
  }
}
