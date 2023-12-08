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
              controller.reverse();
            });
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 400),
            width: isHovering ? 210 : 200,
            height: isHovering ? 60 : 50,
            child: Container(
              width: 200,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: isHovering ? 10 : 2,
                  padding: EdgeInsets.zero,
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
          const Radius.circular(50),
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
