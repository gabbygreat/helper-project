import 'package:flutter/material.dart';
import 'dart:math' as math;

class GradientCircle extends StatefulWidget {
  const GradientCircle({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<GradientCircle> createState() => _GradientCircleState();
}

class _GradientCircleState extends State<GradientCircle> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Gradient Circle'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: SizedBox(
          height: 100,
          width: 100,
          child: CustomPaint(
            painter: ArcPainter(),
          ),
        ),
      ),
    );
  }
}

class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var frontColoredPaint = Paint();
    frontColoredPaint.style = PaintingStyle.stroke;
    frontColoredPaint.strokeWidth = 18;

    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width,
        height: size.height,
      ),
      135.toDegree(),
      120.toDegree(),
      false,
      frontColoredPaint..color = Colors.orange,
    );
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width,
        height: size.height,
      ),
      255.toDegree(),
      120.toDegree(),
      false,
      frontColoredPaint..color = Colors.blue,
    );
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width,
        height: size.height,
      ),
      375.toDegree(),
      120.toDegree(),
      false,
      frontColoredPaint..color = Colors.green,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

extension RadianToDegree on num {
  double toDegree() {
    return this * math.pi / 180;
  }
}
