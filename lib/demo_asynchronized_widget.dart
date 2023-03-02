import 'package:flutter/material.dart';
class DemoAsynchronizedWidget extends StatefulWidget {

  @override
  State<DemoAsynchronizedWidget> createState() => _DemoAsynchronizedWidgetState();
}

class _DemoAsynchronizedWidgetState extends State<DemoAsynchronizedWidget> {

  @override
  void didUpdateWidget(covariant DemoAsynchronizedWidget oldWidget) {
    print("Update");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Async"),
      ),
      body: Container(),
    );
  }
}
