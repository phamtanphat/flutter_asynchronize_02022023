import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:isolate';

class DemoIsolateWidget extends StatefulWidget {
  const DemoIsolateWidget({Key? key}) : super(key: key);

  @override
  State<DemoIsolateWidget> createState() => _DemoIsolateWidgetState();
}

class _DemoIsolateWidgetState extends State<DemoIsolateWidget> {

  void loop() {
    compute(handle, 10000000)
        .then((value) => print(value));
  }

  static int handle(num maxValue) {
    for (var i = 0; i < maxValue; i++) {

    }
    return 100;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Isolate"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              CircularProgressIndicator(),
              ElevatedButton(
                onPressed: () {
                  loop();
                },
                child: Text("Loop"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
