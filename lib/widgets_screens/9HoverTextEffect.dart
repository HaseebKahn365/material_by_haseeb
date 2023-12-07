/*
Alright this is going to be the most complex widget that we are going to build in this project.
This widget is going to contain a method that create a string of random characters which is update every time that the cursor is hovered over the container.
Only a part of the string is going to appear as the cursor hovers over the container.
In simple words, the cursor will act as a torch and the string will act as a wall. 
the string will be transparent but as the cursor hovers over the string, a circular portion of the string will be highlighted.
This will give the effect of a torch being shined on a wall.
 */
import 'dart:math';

import 'package:flutter/material.dart';

class HoverTextWidget extends StatefulWidget {
  const HoverTextWidget({Key? key}) : super(key: key);

  @override
  _HoverTextWidgetState createState() => _HoverTextWidgetState();
}

class _HoverTextWidgetState extends State<HoverTextWidget> {
  static String randomString = createRandomString();
  Offset position = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hover Text'),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.onSecondaryContainer,
        child: MouseRegion(
          onHover: (event) => setState(() {
            position = event.localPosition;
            //also recall the createRandomString method to update the string
            randomString = createRandomString();
          }),
          child: ShaderMask(
            shaderCallback: (bounds) {
              return RadialGradient(
                center: Alignment(
                  (position.dx / bounds.width) * 2 - 1,
                  (position.dy / bounds.height) * 2 - 1,
                ),
                radius: 0.4,
                colors: [
                  //make these color according to the theme. (use best options from color scheme)
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.primary.withOpacity(0.0),
                ],
                stops: [0.0, 0.5, 1.0],
              ).createShader(bounds);
            },
            blendMode: BlendMode.srcIn,
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Abdul\nHaseeb',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontSize: 300,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    randomString,
                    style: TextStyle(color: Colors.black, fontSize: 50),
                  ),
                ),
                //Text above the container to show my name Abdul Haseeb
              ],
            ),
          ),
        ),
      ),
    );
  }

  static String createRandomString() {
    const String chars =
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    final Random rnd = Random(DateTime.now().millisecondsSinceEpoch);
    String result = "";
    for (var i = 0; i < 1000; i++) {
      result += chars[rnd.nextInt(chars.length)];
    }
    return result;
  }
}
