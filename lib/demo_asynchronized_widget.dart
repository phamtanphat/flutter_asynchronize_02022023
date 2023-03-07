import 'dart:async';

import 'package:flutter/material.dart';

class DemoAsynchronizedWidget extends StatefulWidget {

  @override
  State<DemoAsynchronizedWidget> createState() =>
      _DemoAsynchronizedWidgetState();
}

class _DemoAsynchronizedWidgetState extends State<DemoAsynchronizedWidget> {

  @override
  void didUpdateWidget(covariant DemoAsynchronizedWidget oldWidget) {
    handle()
        .then((value) => print(value));
  }

  Future<int> handle() {
    Completer<int> completer = Completer();
    Future.delayed(Duration(seconds: 2), () {
      var number = 5;
      Future.delayed(Duration(seconds: 2), () {
        completer.complete(number + 2);
      });
    });
    return completer.future;
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
