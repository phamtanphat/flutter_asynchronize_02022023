import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class DemoAsynchronizedWidget extends StatefulWidget {

  @override
  State<DemoAsynchronizedWidget> createState() =>
      _DemoAsynchronizedWidgetState();
}

class _DemoAsynchronizedWidgetState extends State<DemoAsynchronizedWidget> {

  Future<int>? futureNumber;

  Future<int> handle() {
    Completer<int> completer = Completer();
    Future.delayed(Duration(seconds: 2), () {
       var random = Random();
       completer.complete(random.nextInt(100));
    });
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Async"),
      ),
      body: Container(
        child: Column(
          children: [
            ElevatedButton(onPressed: () {
              setState(() {
                futureNumber = Future.value(handle());
              });
            }, child: Text("Random number")),
            FutureBuilder(
              initialData: null,
              future: futureNumber,
              builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  print(snapshot.data.toString());
                  switch(snapshot.connectionState) {
                    case ConnectionState.none:
                      return Text("None");
                    case ConnectionState.waiting:
                      return Text("Waiting");
                    default:
                      return Text((snapshot.data ?? 0).toString());
                  }
              },
            ),
          ],
        ),
      ),
    );
  }
}
