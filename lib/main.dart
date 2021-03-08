import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WomensDay(),
    );
  }
}

class WomensDay extends StatefulWidget {
  @override
  _WomensDayState createState() => _WomensDayState();
}

class _WomensDayState extends State<WomensDay> with TickerProviderStateMixin {
  AnimationController _controller;
  var _isShow = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this)
      ..value = 0.5
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 20,
          ),
          Visibility(
            visible: _isShow,
            child: Center(
              child: Lottie.asset(
                'assests/52129-womens-day.json',
                controller: _controller,
                onLoaded: (composition) {
                  _controller.duration = composition.duration;
                },
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 100,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xffD2063B)),
              ),
              onPressed: () {
                setState(() {
                  _isShow = true;
                });
                _controller.forward(
                    from: _controller.value == 1 ? 0 : _controller.value);
              },
              child: Text(
                "Celebrate",
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
