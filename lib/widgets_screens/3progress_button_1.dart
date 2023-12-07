// import this Package in pubspec.yaml file
// dependencies:
//
//   progress_state_button: ^1.0.2

import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';

class ProgressButton1 extends StatefulWidget {
  @override
  _ProgressButton1State createState() => _ProgressButton1State();
}

class _ProgressButton1State extends State<ProgressButton1> {
  ButtonState stateOnlyText = ButtonState.idle;
  ButtonState stateTextWithIcon = ButtonState.idle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ProgressButton.icon(iconedButtons: {
          ButtonState.idle: IconedButton(
            text: 'Send',
            icon: Icon(Icons.send, color: Colors.white),
            color: Theme.of(context).colorScheme.primary,
          ),
          ButtonState.loading: IconedButton(
            text: 'Loading',
            color: Theme.of(context).colorScheme.primary,
          ),
          ButtonState.fail: IconedButton(
              text: 'Failed',
              icon: Icon(Icons.cancel, color: Colors.white),
              color: Colors.red.shade300),
          ButtonState.success: IconedButton(
              text: 'Success',
              icon: Icon(
                Icons.check_circle,
                color: Colors.white,
              ),
              color: Colors.green.shade400)
        }, onPressed: onPressedIconWithText, state: stateTextWithIcon),
      ),
    );
  }

  void onPressedIconWithText() {
    switch (stateTextWithIcon) {
      case ButtonState.idle:
        stateTextWithIcon = ButtonState.loading;
        Future.delayed(
          Duration(seconds: 1),
          () {
            setState(
              () {
                stateTextWithIcon = Random.secure().nextBool()
                    ? ButtonState.success
                    : ButtonState.fail;
              },
            );
          },
        );

        break;
      case ButtonState.loading:
        break;
      case ButtonState.success:
        stateTextWithIcon = ButtonState.idle;
        break;
      case ButtonState.fail:
        stateTextWithIcon = ButtonState.idle;
        break;
    }
    setState(
      () {
        stateTextWithIcon = stateTextWithIcon;
      },
    );
  }
}
