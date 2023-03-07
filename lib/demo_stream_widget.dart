import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class DemoStreamWidget extends StatefulWidget {
  const DemoStreamWidget({Key? key}) : super(key: key);

  @override
  State<DemoStreamWidget> createState() => _DemoStreamWidgetState();
}

class _DemoStreamWidgetState extends State<DemoStreamWidget> {

  StreamController<int> streamController = StreamController();

  @override
  void didUpdateWidget(covariant DemoStreamWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    //1 : Dung future
    // Stream<int> stream = Stream.fromFuture(Future.value(10));
    //
    // stream.listen((event) {
    //   print(event);
    // });

    //2: Dung iterable
    // Stream<int> streamIterable = Stream.fromIterable(Iterable.generate(10, (index) => index + 1));
    //
    // streamIterable.listen((event) {
    //   print(event);
    // });
    
    //3: Dung periodic
    // Stream<int> streamPeriodic = Stream.periodic(Duration(seconds: 1), (count) => count).asBroadcastStream();
    //
    // streamPeriodic.listen((event) {
    //   print("Phase 1 $event");
    // });
    //
    // streamPeriodic.listen((event) {
    //   print("Phase 2 $event");
    // });

    // 4: Them vao phat du lieu tu stream

    // StreamController<int> streamControllerNumber = StreamController();
    //
    // streamControllerNumber.stream.transform(StreamTransformer.fromHandlers(handleData: (input, sink){
    //   sink.add(input + 10);
    // })).listen((event) {
    //   print(event);
    // });
    //
    // // them du lieu
    // streamControllerNumber.sink.add(10);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Demo Async"),
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      var random = Random();
                      var number = random.nextInt(100);
                      streamController.sink.add(number);
                    },
                    child: Text("Random")
                ),
                StreamBuilder(
                    initialData: null,
                    stream: streamController.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      }
                      switch(snapshot.connectionState) {
                        case ConnectionState.none:
                          return Text("None");
                        case ConnectionState.waiting:
                          return Text("Waiting");
                        default:
                          return Text((snapshot.data ?? 0).toString());
                      }
                    }
                )
              ],
            ),
          ),
        )
    );
  }
}
