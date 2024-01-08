// ignore_for_file: prefer_const_constructors

import 'package:bloc_asngment/homepage.dart';
import 'package:flutter/material.dart';

import 'screen2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/screen2': (context) => SecondScreen(),
        // other routes
      },
      title: 'Flutter Demo',
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
