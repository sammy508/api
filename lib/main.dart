

import 'package:flutter/material.dart';
import 'package:projectapione/getApi_example/example_5_complexjson.dart';
import 'package:projectapione/postApi_screen/1st_example.dart';

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
      home: const ExamPle_PostApi () );
  }
}

