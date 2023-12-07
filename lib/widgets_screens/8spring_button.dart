// We are using this plugin => spring_button
// Search it on google For more information.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:spring_button/spring_button.dart';

class SpringButtonWidget extends StatefulWidget {
  SpringButtonWidget({key}) : super(key: key);

  @override
  _SpringButtonWidgetState createState() => _SpringButtonWidgetState();
}

class _SpringButtonWidgetState extends State<SpringButtonWidget> {
  late Timer timer;
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      counter--;
    });
  }

  Widget row(String text, Color color) {
    return Padding(
      padding: EdgeInsets.all(12.5),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(const Radius.circular(20.0)),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12.5,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("")),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Center(
              child: Text(
                counter.toString(),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SpringButton(
              SpringButtonType.OnlyScale,
              row(
                "Increment",
                Colors.deepPurpleAccent,
              ),
              onTapDown: (_) => incrementCounter(),
              onLongPress: () => timer = Timer.periodic(
                const Duration(milliseconds: 100),
                (_) => incrementCounter(),
              ),
              onLongPressEnd: (_) {
                timer?.cancel();
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: SpringButton(
              SpringButtonType.OnlyScale,
              row(
                "Decrement",
                Colors.redAccent,
              ),
              onTapDown: (_) => decrementCounter(),
              onLongPress: () => timer = Timer.periodic(
                const Duration(milliseconds: 100),
                (_) => decrementCounter(),
              ),
              onLongPressEnd: (_) {
                timer?.cancel();
              },
            ),
          ),
        ],
      ),
    );
  }
}
