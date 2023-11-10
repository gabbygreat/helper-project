import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

/// CameraApp is the Main Application.
class CameraApp extends StatefulWidget {
  /// Default Constructor
  const CameraApp({super.key});

  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: CameraPreview(
              controller,
            ),
          ),
          Positioned.fill(
            child: CustomPaint(
              painter: CirclePainter(),
            ),
          )
        ],
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    var path2 = Path();
    var circleRadius = 150;

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width / 2 + circleRadius, size.height / 2);
    path.arcToPoint(
      Offset(size.width / 2 - circleRadius, size.height / 2),
      radius: const Radius.circular(5),
    );
    path.lineTo(0, size.height / 2);
    //
    path2.lineTo(0, size.height / 2);
    path2.lineTo(size.width / 2 - circleRadius, size.height / 2);
    path2.arcToPoint(
      Offset(size.width / 2 + circleRadius, size.height / 2),
      radius: const Radius.circular(20),
    );
    path2.lineTo(size.width, size.height / 2);
    path2.lineTo(size.width, 0);

    canvas.drawPath(
      path,
      Paint()
        ..color = Colors.white
        ..style = PaintingStyle.fill,
    );
    canvas.drawPath(
      path2,
      Paint()
        ..color = Colors.white
        ..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
