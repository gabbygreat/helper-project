import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SampleScreen extends StatefulWidget {
  const SampleScreen({super.key});

  @override
  State<SampleScreen> createState() => _SampleScreenState();
}

class _SampleScreenState extends State<SampleScreen> {
  double circleRadius = 40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomPaint(
              size: const Size(200, 200),
              painter: BoxedPaint(),
            ),
            20.verticalSpace,
            ClipPath(
              clipper: BoxedPath(),
              child: Container(
                color: Colors.red,
                width: 200,
                height: 200,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BoxedPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    double offset = 30;

    var path = Path();
    path.moveTo(offset, 0);
    path.lineTo(0, offset);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class BoxedPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double offset = 30;

    var path = Path();
    path.moveTo(offset, 0);
    path.lineTo(0, offset);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
