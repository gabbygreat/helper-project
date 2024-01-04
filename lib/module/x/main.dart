import 'dart:ui';

import 'package:flutter/material.dart';

class AnimatedX extends StatefulWidget {
  const AnimatedX({super.key});

  @override
  State<AnimatedX> createState() => _AnimatedXState();
}

class _AnimatedXState extends State<AnimatedX> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controller2;
  late Animation<double> _animation;
  late Animation<double> _animation2;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );
    _controller2 = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _animation2 = Tween<double>(begin: 0, end: 1).animate(_controller2);

    _controller.forward();
    _controller2.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }

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
          'X Animation',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.reset();
          _controller2.reset();
          _controller.forward();
          _controller2.forward();
        },
        child: const Icon(
          Icons.play_arrow,
        ),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return AnimatedBuilder(
              animation: _animation2,
              builder: (context, _) {
                return CustomPaint(
                  size: const Size(300, 300),
                  painter: XPaint(
                    progress: _animation.value,
                    progress2: _animation2.value,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class XPaint extends CustomPainter {
  final double progress;
  final double progress2;

  XPaint({
    required this.progress,
    required this.progress2,
  });
  @override
  void paint(Canvas canvas, Size size) {
    double largeWidth = 70;
    double smallWidth = largeWidth / 3;
    double offset = 8;
    double redOffset = 14;
    //
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..color = Colors.white;
    //
    Paint blurPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20
      ..imageFilter = ImageFilter.blur(sigmaX: 10, sigmaY: 10)
      ..color = const Color.fromARGB(255, 105, 141, 255);
    //
    Paint redPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..color = Colors.white;
    //
    Paint redBlurPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14
      ..imageFilter = ImageFilter.blur(sigmaX: 10, sigmaY: 10)
      ..color = const Color.fromARGB(255, 255, 74, 137);

    Path path = Path();
    Path redPath = Path();

    path.lineTo(largeWidth, 0);
    path.lineTo(
      (size.width / 2) + smallWidth - offset,
      (size.height / 2) - (smallWidth * 2) + offset,
    );
    path.lineTo(size.width - smallWidth, 0);
    path.lineTo(size.width, 0);
    path.lineTo(
      (size.width / 2) + smallWidth + offset / 2,
      (size.height / 2) - smallWidth,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(size.width - largeWidth, size.height);
    path.lineTo(
      (size.width / 2) - smallWidth + offset,
      (size.height / 2) + (smallWidth * 2) - offset * 2,
    );
    path.lineTo(smallWidth, size.height);
    path.lineTo(0, size.height);
    path.lineTo(
      (size.width / 2) - smallWidth - offset,
      (size.height / 2) + (smallWidth * 2) - offset * 4,
    );
    path.lineTo(0, 0);

    //RED
    redPath.moveTo(
      size.width - redOffset * 2,
      size.height - redOffset,
    );
    redPath.lineTo(
      size.width - largeWidth + redOffset,
      size.height - redOffset,
    );
    redPath.lineTo(redOffset * 2, redOffset);
    redPath.lineTo(largeWidth - redOffset, redOffset);
    redPath.close();
    //

    PathMetrics pathMetrics = path.computeMetrics();
    for (var metric in pathMetrics) {
      double length = metric.length * progress;
      Path extractPath = metric.extractPath(0, length);
      canvas.drawPath(extractPath, blurPaint);
      canvas.drawPath(extractPath, paint);
    }

    PathMetrics redPathMetrics = redPath.computeMetrics();
    for (var metric in redPathMetrics) {
      double length = metric.length * progress2;
      Path extractPath = metric.extractPath(0, length);
      canvas.drawPath(extractPath, redPaint);
      canvas.drawPath(extractPath, redBlurPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
