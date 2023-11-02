import 'package:flutter/material.dart';

class OverlapArc extends StatefulWidget {
  const OverlapArc({super.key});

  @override
  State<OverlapArc> createState() => _OverlapArcState();
}

class _OverlapArcState extends State<OverlapArc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          ClipRRect(
            child: Container(
              color: const Color.fromRGBO(16, 27, 44, 1),
              width: MediaQuery.sizeOf(context).width,
              height: 300,
              child: CustomPaint(
                painter: BackgroundPainter(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color.fromRGBO(31, 46, 60, 1)
      ..style = PaintingStyle.fill;
    Paint paint1 = Paint()
      ..color = const Color.fromRGBO(22, 37, 51, 1)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(0.20 * size.width, 0.06 * size.height),
      size.height,
      paint1,
    );
    canvas.drawCircle(
      Offset(0.15 * size.width, 0),
      size.height - 80,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
