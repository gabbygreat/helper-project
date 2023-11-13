import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

/// CameraApp is the Main Application.
class SampleScreen extends StatefulWidget {
  /// Default Constructor
  const SampleScreen({super.key});

  @override
  State<SampleScreen> createState() => _SampleScreenState();
}

class _SampleScreenState extends State<SampleScreen> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[1], ResolutionPreset.max);
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
    var width = MediaQuery.sizeOf(context).width * 0.8;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Camera Test"),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Take a selfie'),
                const SizedBox(
                  height: 5,
                ),
                const Text('Kindly take a picture boss'),
                Center(
                  child: SizedBox(
                    height: width,
                    width: width,
                    child: Stack(
                      children: [
                        Center(
                          child: CameraPreview(
                            controller,
                          ),
                        ),
                        Positioned.fill(
                          child: CustomPaint(
                            painter: CirclePainter(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Center(
                  child: Column(
                    children: [
                      Text(
                        'Face detected',
                      ),
                      Text(
                        'Face detected',
                      ),
                      Text(
                        'Face detected',
                      ),
                      Text(
                        'Face detected',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Take Picture'),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Submit'),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
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
    var circleRadius = 80;

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
