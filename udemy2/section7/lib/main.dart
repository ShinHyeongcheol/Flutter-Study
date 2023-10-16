import 'package:flutter/material.dart';
import 'package:section7/ui_updates_demo.dart';
import 'package:section7/keys/keys.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Internals'),
        ),
        //body: UIUpdatesDemo(),
        body: const Keys(),
      ),
    );
  }
}
