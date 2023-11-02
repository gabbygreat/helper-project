import 'package:flutter/material.dart';

class CathedralDoor extends StatefulWidget {
  const CathedralDoor({super.key});

  @override
  State<CathedralDoor> createState() => _CathedralDoorState();
}

class _CathedralDoorState extends State<CathedralDoor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cathedral Door'),
      ),
      backgroundColor: Colors.grey,
      body: Stack(
        children: [
          ClipPath(
            clipper: DoorClip(),
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              alignment: Alignment.bottomCenter,
              color: Colors.white,
            ),
          ),
          Align(
            alignment: const Alignment(0, -0.93),
            child: Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DoorClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(20, 150);
    path.lineTo(20, size.height);
    path.lineTo(size.width - 20, size.height);
    path.lineTo(size.width - 20, 150);
    path.quadraticBezierTo(size.width - 20, 40, size.width / 2, 30);
    path.quadraticBezierTo(20, 40, 20, 150);
    // path.quadraticBezierTo(20, 100, 20 + 90, 50);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
