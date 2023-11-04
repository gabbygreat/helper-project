import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';

class SunEarthMoon extends StatefulWidget {
  const SunEarthMoon({super.key});

  @override
  State<SunEarthMoon> createState() => _SunEarthMoonState();
}

class _SunEarthMoonState extends State<SunEarthMoon>
    with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;
  late Animation<double> _animation2;
  late AnimationController _controller2;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )
      ..repeat()
      ..addListener(() {
        setState(() {});
      });
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )
      ..repeat()
      ..addListener(() {
        setState(() {});
      });
    _animation2 = Tween<double>(begin: 0, end: 1).animate(_controller2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 35, 35, 35),
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Center(
        child: CustomPaint(
          size: const Size(250, 250),
          painter: PlanetarySystem(
            animation: _animation,
            animation2: _animation2,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }
}

class PlanetarySystem extends CustomPainter {
  final Animation animation;
  final Animation animation2;

  PlanetarySystem({
    required this.animation,
    required this.animation2,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final angle = animation.value * 2 * math.pi;
    final angle2 = animation2.value * 2 * math.pi;

    final x = centerX + math.cos(angle) * (size.width / 2 - 30);
    final y = centerY + math.sin(angle) * (size.height / 2 - 30);

    final moonX = x + math.cos(angle2) * (30);
    final moonY = y + math.sin(angle2) * (30);

    var earthPathPaint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5;

    var moonPathPaint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5;

    var sunPaintBlur = Paint()
      ..color = const Color.fromARGB(255, 247, 248, 9)
      ..imageFilter = ImageFilter.blur(sigmaX: 20, sigmaY: 20);

    var sunPaint = Paint()..color = const Color.fromARGB(255, 247, 248, 9);

    var earthPaint = Paint()..color = Colors.green;

    var moonPaint = Paint()..color = Colors.white;

    /// Blurred Sun
    canvas.drawCircle(
      Offset(centerX, centerY),
      25,
      sunPaintBlur,
    );

    /// Sun
    canvas.drawCircle(
      Offset(centerX, centerY),
      25,
      sunPaint,
    );

    /// Earth Path
    canvas.drawCircle(
      Offset(centerX, centerY),
      (centerX) - 30,
      earthPathPaint,
    );

    /// Moon Path
    canvas.drawCircle(
      Offset(x, y),
      30,
      moonPathPaint,
    );

    /// Earth
    canvas.drawCircle(
      Offset(x, y),
      12,
      earthPaint,
    );

    /// Moon
    canvas.drawCircle(
      Offset(moonX, moonY),
      6,
      moonPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
