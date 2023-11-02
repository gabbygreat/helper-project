import 'package:flutter/material.dart';

class WavyClip extends StatefulWidget {
  const WavyClip({super.key});

  @override
  State<WavyClip> createState() => _WavyClipState();
}

class _WavyClipState extends State<WavyClip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 107, 98, 254),
        title: const Text('Wavy Clip'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.only(
                left: 50,
                right: 50,
                bottom: 20,
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Continue with email',
                      prefixIcon: Icon(
                        Icons.mail,
                      ),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Continue with phone number',
                      prefixIcon: Icon(
                        Icons.phone,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ClipPath(
              clipper: WavyClipper(),
              child: Container(
                color: const Color.fromARGB(255, 107, 98, 254),
                padding: const EdgeInsets.only(bottom: 30),
                width: MediaQuery.sizeOf(context).width,
                alignment: Alignment.bottomCenter,
                child: const Text('Joined us before ?'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WavyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    var valley = 100.0;

    path.moveTo(0, valley);
    path.cubicTo(
        size.width / 4, 0, size.width / 2, valley * 2, size.width, valley / 2);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
