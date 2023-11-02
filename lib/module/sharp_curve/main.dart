import 'package:flutter/material.dart';

class SharpCurve extends StatefulWidget {
  const SharpCurve({super.key});

  @override
  State<SharpCurve> createState() => _SharpCurveState();
}

class _SharpCurveState extends State<SharpCurve> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Stack(
        children: [
          Container(
            // color: Colors.red,
            height: MediaQuery.sizeOf(context).height,
          ),
          ClipPath(
            clipper: CurvedPath(),
            child: Container(
              color: const Color.fromARGB(255, 26, 51, 104),
              height: MediaQuery.sizeOf(context).height * 0.6,
            ),
          ),
        ],
      ),
    );
  }
}

class CurvedPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double offset = 60;
    path.moveTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(0, size.height - (offset * 2));
    path.quadraticBezierTo(
        0, size.height - offset, offset, size.height - offset);
    path.lineTo(size.width - offset, size.height - offset);
    path.quadraticBezierTo(
      size.width,
      size.height - offset,
      size.width,
      size.height,
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
