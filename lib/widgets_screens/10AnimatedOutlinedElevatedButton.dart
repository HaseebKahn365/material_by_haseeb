// Now that we have implemented everything. Now it is time to create a special elevated button "AnimatedOutlinedElevatedButton" with the following  abilities,

// When the cursor hovers over the elevated button the size of the button should increase slightly.
// The outline of the button should be animated like a progress indicator from top left corner all the way around the button and back to the top left corner.

import 'package:flutter/material.dart';

class AnimatedOutlinedElevatedButton extends StatefulWidget {
  const AnimatedOutlinedElevatedButton({Key? key}) : super(key: key);

  @override
  State<AnimatedOutlinedElevatedButton> createState() =>
      _AnimatedOutlinedElevatedButtonState();
}

class _AnimatedOutlinedElevatedButtonState
    extends State<AnimatedOutlinedElevatedButton>
    with SingleTickerProviderStateMixin {
  bool isHovering = false;
  bool animationStarted = false;
  late AnimationController controller;
  late OutlinePainter outlinePainter;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    outlinePainter = OutlinePainter(controller, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedOutlinedElevatedButton'),
      ),
      body: Center(
        child: MouseRegion(
          onEnter: (_) {
            setState(() {
              isHovering = true;
              if (!animationStarted) {
                controller.forward();
                animationStarted = true;
              }
            });
          },
          onExit: (_) {
            setState(() {
              isHovering = false;
              animationStarted = false;
              controller
                  .reverse(); // Reverse the animation when the mouse exits
            });
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 400),
            width: isHovering ? 210 : 200,
            height: isHovering ? 60 : 50,
            child: Container(
              width: 200, // specify the width here
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  //the elevation should increase when the cursor hovers over the button
                  elevation: isHovering ? 10 : 2,
                  //making the padding zero will make the button size to be the same as the container
                  padding: EdgeInsets.zero, //hell yeah,!! this is what i wanted
                ),
                child: CustomPaint(
                  painter: outlinePainter,
                  child: Center(
                    child: Text(
                      'Button',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class OutlinePainter extends CustomPainter {
  final Animation<double> animation;
  final BuildContext context;

  OutlinePainter(this.animation, {required this.context})
      : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final double strokeWidth = 1.5;

    final paint = Paint()
      ..color =
          Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.3)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final progress = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
            strokeWidth / 2,
            strokeWidth / 2,
            size.width - strokeWidth,
            size.height - strokeWidth,
          ),
          const Radius.circular(
              50), // increase the radius to make corners more circular
        ),
      )
      ..close();

    final pathMetrics = progress.computeMetrics();
    final pathMetric = pathMetrics.first;

    final outlinePath = pathMetric.extractPath(
      0.0,
      pathMetric.length * animation.value,
    );

    canvas.drawPath(outlinePath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
