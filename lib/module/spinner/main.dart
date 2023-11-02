import 'package:flutter/material.dart';
import 'dart:math' as math;

class Spinner extends StatefulWidget {
  const Spinner({super.key});

  @override
  State<Spinner> createState() => _SpinnerState();
}

class _SpinnerState extends State<Spinner> with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    animation = Tween<double>(begin: (-11).toDegree(), end: 11.toDegree())
        .animate(animationController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animationController.forward();
        }
      });

    animationController.forward();
  }

  @override
  dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Spinner'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: 300,
              width: 300,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: CustomPaint(
                      painter: SpinPainter(),
                    ),
                  ),
                  Align(
                    alignment: const Alignment(0, 0.6),
                    child: RotationTransition(
                      turns: animation,
                      child: SizedBox(
                        height: 200,
                        width: 100,
                        child: CustomPaint(
                          painter: PinPainter(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PinPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    var paint = Paint()..color = Colors.red;
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width / 2 - 10, size.height / 2 - 10);
    path.quadraticBezierTo(
      size.width / 2,
      size.height / 2,
      size.width / 2 + 10,
      size.height / 2 - 10,
    );

    canvas.drawPath(path, paint);
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2 - 15),
      5,
      Paint()..color = Colors.white,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class SpinPainter extends CustomPainter {
  List<int> percebt = [0, 72, 54, 36, 18, 0];

  List<Color> getRandomColors = [
    Colors.blue,
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.pink,
  ];

  @override
  void paint(Canvas canvas, Size size) {
    var thickness = 40.0;
    var backgroundPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = thickness
      ..style = PaintingStyle.stroke;

    for (int i = 1; i <= 5; i++) {
      backgroundPaint.color = getRandomColors[i - 1];

      var sum = percebt.sublist(0, i).reduce(
            (value, element) => value + element,
          );

      canvas.drawArc(
        Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: size.width / 2 - thickness / 2,
        ),
        (180 + sum).toDegree(),
        (percebt[i]).toDegree(),
        false,
        backgroundPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

extension RadianToDegree on num {
  double toDegree() {
    return this * math.pi / 180;
  }
}
