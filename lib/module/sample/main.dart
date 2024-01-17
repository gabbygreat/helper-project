import 'dart:ui';

import 'package:flutter/material.dart';

class DialogBody extends StatefulWidget {
  const DialogBody({super.key});

  @override
  State<DialogBody> createState() => _DialogBodyState();
}

class _DialogBodyState extends State<DialogBody> {
  double circleRadius = 40;

  @override
  Widget build(BuildContext context) {
    var boxHeight = MediaQuery.sizeOf(context).height * 0.4;
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          //we can set a height of our choice
          height: boxHeight,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: FractionallySizedBox(
                  //90% of the whatever height we choose
                  heightFactor: 0.9,
                  child: ClipPath(
                    clipper: CurvedPath(
                      circleDiameter: boxHeight * 0.2,
                    ),
                    child: Container(
                      color: const Color.fromRGBO(16, 52, 165, 1),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: FractionallySizedBox(
                  // occupies 20% of that desired height
                  heightFactor: 0.2,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(16, 52, 165, 1),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CurvedPath extends CustomClipper<Path> {
  final double circleDiameter;

  CurvedPath({required this.circleDiameter});

  @override
  Path getClip(Size size) {
    var path = Path();
    double offset = 15;
    var padding = 22.72;
    var bottomPad = padding / 3;

    path.moveTo(0, offset);
    path.lineTo(0, size.height - offset);
    path.quadraticBezierTo(0, size.height, offset, size.height);
    path.lineTo(size.width - offset, size.height);
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width,
      size.height - offset,
    );
    path.lineTo(size.width, offset);
    path.quadraticBezierTo(
      size.width,
      0,
      size.width - offset,
      0,
    );

    /// Begin of the curve

    path.lineTo((size.width / 2) + 60, 0);
    path.cubicTo(
      (size.width / 2) + 35, // you can adjust
      0,
      (size.width / 2) + 50, // you can adjust
      40,
      size.width / 2, // you can adjust
      45,
    );
    path.cubicTo(
      (size.width / 2) - 35, // you can adjust
      45,
      (size.width / 2) - 45, // you can adjust
      0,
      (size.width / 2) - 60, // you can adjust
      0,
    );

    /// End of the curve

    path.lineTo(offset, 0);
    path.quadraticBezierTo(0, 0, 0, offset);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

Future<T?> showAppDiolog<T>(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (context) => const DialogBody(),
  );
}

class SampleScreen extends StatefulWidget {
  const SampleScreen({super.key});

  @override
  State<SampleScreen> createState() => _SampleScreenState();
}

class _SampleScreenState extends State<SampleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => showAppDiolog(context),
          child: const Text('Press'),
        ),
      ),
    );
  }
}
