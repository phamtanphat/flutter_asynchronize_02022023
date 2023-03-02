import 'package:flutter/material.dart';

class DemoAsynchronizedWidget extends StatefulWidget {

  @override
  State<DemoAsynchronizedWidget> createState() =>
      _DemoAsynchronizedWidgetState();
}

class _DemoAsynchronizedWidgetState extends State<DemoAsynchronizedWidget> {

  @override
  void didUpdateWidget(covariant DemoAsynchronizedWidget oldWidget) {
    int a = 5;
    int b = 10;
    cong(a, b)
      .then((tong) => tru(tong, a))
      .then((hieu) => cong(hieu, b))
      .then((result) => print(result))
      .catchError((error) => print(error));
  }

  Future<int> cong(int a, int b) {
    return Future.delayed(Duration(seconds: 1), () => a + b);
  }

  Future<int> tru(int a, int b) {
    return Future.delayed(Duration(seconds: 1), () => a - b);
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
