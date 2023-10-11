import 'package:flutter/material.dart';
import 'package:projectapione/example_2.dart';
import 'package:projectapione/example_3.dart';
import 'package:projectapione/example_4.dart';
import 'package:projectapione/example_5_complexjson.dart';
import 'package:projectapione/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const GetApiLastExample () );
  }
}

