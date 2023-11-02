import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter/services.dart';

class GlowingArc extends StatefulWidget {
  const GlowingArc({super.key});

  @override
  State<GlowingArc> createState() => _GlowingArcState();
}

class _GlowingArcState extends State<GlowingArc> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.yellow),
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 300,
                width: 300,
                child: CustomPaint(
                  painter: ArcPainter(),
                ),
              ),
              SizedBox(
                height: 300,
                width: 300,
                child: Builder(builder: (context) {
                  double percentage = 100;
                  return Stack(
                    children: [
                      Positioned.fill(
                        child: CustomPaint(
                          painter: PercentagePainter(
                            percentage: percentage,
                          ),
                        ),
                      ),
                      Align(
                        alignment: const Alignment(0, 0.3),
                        child: Text(
                          '${percentage.toInt()}',
                          style: const TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var backGreyPaint = Paint();
    backGreyPaint.color = Colors.grey;
    backGreyPaint.style = PaintingStyle.stroke;
    backGreyPaint.strokeCap = StrokeCap.round;
    backGreyPaint.strokeWidth = 10;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width,
        height: size.height,
      ),
      math.pi,
      math.pi,
      false,
      backGreyPaint,
    );

    var frontColoredPaint = Paint();
    var shadowPaint = Paint();
    frontColoredPaint.style = PaintingStyle.stroke;
    shadowPaint.style = PaintingStyle.stroke;
    frontColoredPaint.strokeCap = StrokeCap.round;
    shadowPaint.strokeCap = StrokeCap.round;
    frontColoredPaint.strokeWidth = 18;
    shadowPaint.strokeWidth = 18;
    shadowPaint.imageFilter = ImageFilter.blur(sigmaX: 10, sigmaY: 10);

    List<Color> color = [Colors.green, Colors.orange, Colors.purple];

    for (int i = 0; i < 3; i++) {
      shadowPaint.color = color[i];
      canvas.drawArc(
        Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: size.width,
          height: size.height,
        ),
        math.pi + i * 0.7,
        math.pi / 6,
        false,
        shadowPaint,
      );
    }
    for (int i = 0; i < 3; i++) {
      frontColoredPaint.color = color[i];
      canvas.drawArc(
        Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: size.width,
          height: size.height,
        ),
        math.pi + i * 0.7,
        math.pi / 6,
        false,
        frontColoredPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class PercentagePainter extends CustomPainter {
  final double percentage;
  PercentagePainter({this.percentage = 50});
  @override
  void paint(Canvas canvas, Size size) {
    var frontColoredPaint = Paint();
    frontColoredPaint.style = PaintingStyle.stroke;
    frontColoredPaint.strokeCap = StrokeCap.round;
    frontColoredPaint.strokeWidth = 10;

    double start = 160;

    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width,
        height: size.height,
      ),
      start.toRadians(),
      (220 * (percentage / 100)).toRadians(),
      false,
      frontColoredPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

extension NumToRadians on num {
  double toRadians() {
    return toDouble() * (math.pi / 180.0);
  }

  double toDegree() {
    return toDouble() * (180 / math.pi);
  }
}
