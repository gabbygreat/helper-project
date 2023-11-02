import 'package:flutter/material.dart';

class CurvyCard extends StatefulWidget {
  const CurvyCard({super.key});

  @override
  State<CurvyCard> createState() => _CurvyCardState();
}

class _CurvyCardState extends State<CurvyCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Center(
        child: SizedBox(
          height: 200,
          width: 300,
          child: Card(
            elevation: 3,
            shadowColor: Colors.white,
            child: CustomPaint(
              painter: CurvyPaint(),
            ),
          ),
        ),
      ),
    );
  }
}

class CurvyPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = Colors.purple;
    var path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width * 0.75, size.height);
    path.cubicTo(
      size.width * 0.7,
      size.height * 0.5,
      size.width * 0.5,
      size.height * 0.3,
      size.width * 0.5,
      0,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
