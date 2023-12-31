import 'dart:async';

import 'package:flutter/material.dart';


class AnimatedVideo extends StatefulWidget {
  const AnimatedVideo({super.key});

  @override
  State<AnimatedVideo> createState() => _AnimatedVideoState();
}

class _AnimatedVideoState extends State<AnimatedVideo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'Slider Hover',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: const AnimatedDashedLine(),
    );
  }
}

class AnimatedDashedLine extends StatefulWidget {
  const AnimatedDashedLine({super.key});

  @override
  State<AnimatedDashedLine> createState() => _AnimatedDashedLineState();
}

class _AnimatedDashedLineState extends State<AnimatedDashedLine> {
  late Timer _timer;
  List<bool> dashColors = List.generate(10, (index) => index.isEven);

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      setState(() {
        dashColors = dashColors.reversed.toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomPaint(
            size: const Size(100, 2),
            painter: DottedLinePainter(
              numDashes: 10,
              dashColors: dashColors,
            ),
          ),
          CustomPaint(
            size: const Size(100, 2),
            painter: DottedLinePainter(
              numDashes: 10,
              dashColors: dashColors,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

class DottedLinePainter extends CustomPainter {
  final int numDashes;
  final List<bool> dashColors;

  DottedLinePainter({
    required this.numDashes,
    required this.dashColors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    const double dashSpace = 0;

    double dashWidth = (size.width - (numDashes - 1) * dashSpace) / numDashes;
    double startX = 0;

    for (int i = 0; i < numDashes; i++) {
      paint.color = dashColors[i] ? Colors.white : Colors.black;
      canvas.drawLine(
        Offset(startX, size.height / 2),
        Offset(startX + dashWidth, size.height / 2),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
