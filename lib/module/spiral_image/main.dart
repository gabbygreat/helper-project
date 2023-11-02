import 'package:flutter/material.dart';
import 'dart:math' as math;

class SpiralImage extends StatefulWidget {
  const SpiralImage({super.key});

  @override
  State<SpiralImage> createState() => _SpiralImageState();
}

class _SpiralImageState extends State<SpiralImage>
    with TickerProviderStateMixin {
  late AnimationController first;
  late Animation<double> firstAnimation;

  late AnimationController second;
  late Animation<double> secondAnimation;

  bool isAnimating = false;

  @override
  void initState() {
    super.initState();
    first = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
      reverseDuration: const Duration(milliseconds: 5000),
    );

    firstAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(first);

    second = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
      reverseDuration: const Duration(seconds: 3),
    );

    secondAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(second);
  }

  @override
  void dispose() {
    first.dispose();
    second.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Spiral Image'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (!isAnimating) {
            first.repeat();
            second.reverse();
            second.repeat();
          } else {
            first.stop();
            second.stop();
          }
          isAnimating = !isAnimating;
        },
        child: const Text('Rotate'),
      ),
      body: Center(
        child: SizedBox(
          height: 0.8 * size.width + 50,
          width: 0.8 * size.width + 50,
          child: Stack(
            children: [
              Center(
                child: RotationTransition(
                  turns: firstAnimation,
                  child: SizedBox(
                    height: 0.8 * size.width,
                    width: 0.8 * size.width,
                    child: CustomPaint(
                      painter: DashedCirclePainter(),
                    ),
                  ),
                ),
              ),
              Center(
                child: RotationTransition(
                  turns: secondAnimation,
                  child: SizedBox(
                    height: 0.5 * size.width,
                    width: 0.5 * size.width,
                    child: CustomPaint(
                      painter: DashedCirclePainter(
                        dashes: 15,
                      ),
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: Alignment(-0.6, -0.8),
                child: CircleAvatar(
                  radius: 30,
                ),
              ),
              const Align(
                alignment: Alignment(1, 0.2),
                child: CircleAvatar(
                  radius: 30,
                ),
              ),
              const Align(
                alignment: Alignment(-0.6, 0.8),
                child: CircleAvatar(
                  radius: 30,
                ),
              ),
              const Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 30,
                ),
              ),
              const Align(
                alignment: Alignment(-0.6, 0),
                child: CircleAvatar(
                  radius: 20,
                ),
              ),
              const Align(
                alignment: Alignment(0.4, 0.45),
                child: CircleAvatar(
                  radius: 20,
                ),
              ),
              const Align(
                alignment: Alignment(0.25, -0.55),
                child: CircleAvatar(
                  radius: 20,
                ),
              ),
              const Align(
                alignment: Alignment(-0.4, -0.4),
                child: CircleAvatar(
                  radius: 10,
                ),
              ),
              const Align(
                alignment: Alignment(-0.2, 0.55),
                child: CircleAvatar(
                  radius: 10,
                ),
              ),
              const Align(
                alignment: Alignment(0.58, 0),
                child: CircleAvatar(
                  radius: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashedCirclePainter extends CustomPainter {
  final int dashes;
  final Color color;
  final double gapSize;
  final double strokeWidth;

  DashedCirclePainter({
    this.dashes = 20,
    this.color = Colors.grey,
    this.gapSize = 5,
    this.strokeWidth = 2,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double gap = math.pi / 180 * gapSize;
    final double singleAngle = (math.pi * 2) / dashes;

    for (int i = 0; i < dashes; i++) {
      final Paint paint = Paint()
        ..color = color
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke;

      canvas.drawArc(Offset.zero & size, gap + singleAngle * i,
          singleAngle - gap * 2, false, paint);
    }
  }

  @override
  bool shouldRepaint(DashedCirclePainter oldDelegate) {
    return dashes != oldDelegate.dashes || color != oldDelegate.color;
  }
}

extension RadianToDegree on num {
  double toDegree() {
    return this * math.pi / 180;
  }
}
