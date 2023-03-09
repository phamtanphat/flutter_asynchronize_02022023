import 'package:flutter/material.dart';
class DemoIsolateWidget extends StatefulWidget {
  const DemoIsolateWidget({Key? key}) : super(key: key);

  @override
  State<DemoIsolateWidget> createState() => _DemoIsolateWidgetState();
}

class _DemoIsolateWidgetState extends State<DemoIsolateWidget> {

  void loop() {
    Future.delayed(Duration(seconds: 1), () {
      for (var i = 0; i < 10000000000; i++) {
        print(i);
      }
    });
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
