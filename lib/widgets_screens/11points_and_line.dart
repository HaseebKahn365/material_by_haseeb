/*

This is another useful widget that I have been planning to implement for a game.
We will start off creating a point object that has the following properties:
origin
pointRadius
isActivated
detectionRadius
Using the above concept of point, we want to create an interface similar to the android lock screen patter to allow the user to connect two points and draw a straight line while connecting these points. Here is how the user interacts:
the user touches on a point object. The spot on the screen where the user tries to touch the point must be in detection radius of the point. Then the user starts dragging and reaches the detection radius of another point. When this happens, the point will capture the line and then a new line will start from the second point, kind of like the lock screen pattern of android. 
This is gonna be a complicated widget so put some thought and create the widget that achieves the above functionality.


 */

//CREATING A POINT CLASS:

import 'dart:ui';

import 'package:flutter/material.dart';

class Point {
  Offset origin;
  double pointRadius;
  bool isActivated;
  double detectionRadius;

  Point({
    required this.origin,
    required this.pointRadius,
    required this.isActivated,
    required this.detectionRadius,
  });
}

class TwoPointsConnect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ConnectPoints(),
      ),
    );
  }
}

class ConnectPoints extends StatefulWidget {
  @override
  _ConnectPointsState createState() => _ConnectPointsState();
}

class _ConnectPointsState extends State<ConnectPoints> {
  List<Point> points = [
    Point(
        origin: Offset(100, 100),
        pointRadius: 20,
        isActivated: false,
        detectionRadius: 50),
    Point(
        origin: Offset(300, 100), // Adjusted the position of the second point
        pointRadius: 50,
        isActivated: false,
        detectionRadius: 50),
  ];

  Point? activatedPoint;
  Point? otherPoint; // Added variable to track the other point

  Offset? lastPosition;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: (details) {
        activatedPoint = findActivatedPoint(details.globalPosition);
        if (activatedPoint != null) {
          setState(() {
            activatedPoint!.isActivated = true;
            lastPosition = details.globalPosition;
          });
        }
      },
      onPanUpdate: (details) {
        if (activatedPoint != null) {
          setState(() {
            lastPosition = details.globalPosition;

            // Check if the other point is within the detection radius
            otherPoint = findActivatedPoint(lastPosition!);
            if (otherPoint != null && otherPoint != activatedPoint) {
              otherPoint!.isActivated = true;
            }
          });
        }
      },
      onPanEnd: (details) {
        if (activatedPoint != null) {
          Point? secondPoint = findActivatedPoint(lastPosition!);
          if (secondPoint != null && secondPoint != activatedPoint) {
            setState(() {
              activatedPoint!.isActivated = false;
            });
          }
          setState(() {
            // activatedPoint = null;
            // otherPoint = null; // Reset the other point
          });
        }
      },
      child: CustomPaint(
        painter: LinePainter(
            points: points,
            activatedPoint: activatedPoint,
            lastPosition: lastPosition,
            otherPoint: otherPoint),
        size: Size.infinite,
      ),
    );
  }

  Point? findActivatedPoint(Offset position) {
    for (Point point in points) {
      double distance = (point.origin - position).distance;
      if (distance <= point.detectionRadius && !point.isActivated) {
        return point;
      }
    }
    return null;
  }
}

class LinePainter extends CustomPainter {
  final List<Point> points;
  final Point? activatedPoint;
  final Offset? lastPosition;
  final Point? otherPoint;

  LinePainter(
      {required this.points,
      required this.activatedPoint,
      required this.lastPosition,
      required this.otherPoint});

  @override
  void paint(Canvas canvas, Size size) {
    Paint linePaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2.0;

    // Draw lines
    if (activatedPoint != null && lastPosition != null) {
      canvas.drawLine(activatedPoint!.origin, lastPosition!, linePaint);
    }

    // Draw points
    Paint pointPaint = Paint()..color = Colors.red;
    for (Point point in points) {
      pointPaint.color = point.isActivated ? Colors.green : Colors.blue;
      canvas.drawCircle(point.origin, point.pointRadius, pointPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
