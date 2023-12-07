import 'package:flutter/material.dart';

class ResponsiveIcons extends StatefulWidget {
  @override
  _ResponsiveIconsState createState() => _ResponsiveIconsState();
}

class _ResponsiveIconsState extends State<ResponsiveIcons>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool tap = true;
  bool show = true;
  bool isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    _animation = Tween<double>(begin: 30, end: 50).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          //make it appear smaller when pressed
          transform: Matrix4.identity()..scale(isPressed ? 0.7 : 1.0),
          transformAlignment: Alignment.center,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              mouseCursor: SystemMouseCursors.click,
              onHighlightChanged: (value) {
                tap = !value;
                show = false;
                if (tap == true) {
                  _controller.forward();
                } else {
                  _controller.reverse();
                }
              },
              onTap: () {
                show = false;
                setState(() {
                  isPressed = true;
                });
              },
              child: AnimatedContainer(
                curve: Curves.fastLinearToSlowEaseIn,
                duration: Duration(milliseconds: 1500),
                height: tap ? 100 : 70,
                width: tap ? 100 : 70,
                decoration: BoxDecoration(
                    color: isPressed ? Colors.white : Color(0xFFFF5757),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: (!isPressed)
                              ? Color(0xFFFF5757).withOpacity(0.7)
                              : const Color.fromARGB(255, 237, 198, 198)
                                  .withOpacity(0.7),
                          offset: Offset(0, 5),
                          blurRadius: 50)
                    ]),
                child: Icon(
                  Icons.favorite,
                  color: isPressed ? Color(0xFFFF5757) : Colors.white,
                  size: show ? 50 : _animation.value,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
