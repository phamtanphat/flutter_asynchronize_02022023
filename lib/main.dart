import 'package:flutter/material.dart';
import 'package:flutter_asynchronize_02022023/demo_asynchronized_widget.dart';
import 'package:flutter_asynchronize_02022023/demo_stream_widget.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: DemoStreamWidget()
    );
  }
}
