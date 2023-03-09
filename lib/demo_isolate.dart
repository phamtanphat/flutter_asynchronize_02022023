import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:isolate';

class DemoIsolateWidget extends StatefulWidget {
  const DemoIsolateWidget({Key? key}) : super(key: key);

  @override
  State<DemoIsolateWidget> createState() => _DemoIsolateWidgetState();
}

class _DemoIsolateWidgetState extends State<DemoIsolateWidget> {

  void loop() async{
    ReceivePort receivePort = ReceivePort();
    ReceivePort errorPort = ReceivePort();
    Isolate.spawn(handle, receivePort.sendPort, onError: receivePort.sendPort);

    receivePort.listen((message) {
      print(message);
    });

    errorPort.listen((message) {
      print(message[0]);
    }).onError((error) {
      print(error);
    });

  }

  static void handle(SendPort sendPort) {
    var total = 0;
    for (var i = 0; i < 100000000; i++) {
      total += i;
    }
    throw Exception("error");
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
