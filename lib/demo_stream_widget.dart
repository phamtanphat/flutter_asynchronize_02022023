import 'package:flutter/material.dart';

class DemoStreamWidget extends StatefulWidget {
  const DemoStreamWidget({Key? key}) : super(key: key);

  @override
  State<DemoStreamWidget> createState() => _DemoStreamWidgetState();
}

class _DemoStreamWidgetState extends State<DemoStreamWidget> {

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
    Stream<int> streamPeriodic = Stream.periodic(Duration(seconds: 1), (count) => count);
    var subscription = streamPeriodic.listen((event) {
      print(event);
    });

    Future.delayed(Duration(seconds: 5), () => subscription.pause(Future.delayed(Duration(seconds: 2), () {
      subscription.resume();
    })));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Demo Async"),
        ),
        body: Container(

        )
    );
  }
}
