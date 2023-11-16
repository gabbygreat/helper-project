import 'package:flutter/material.dart';

class SampleScreen extends StatefulWidget {
  const SampleScreen({super.key});

  @override
  State<SampleScreen> createState() => _SampleScreenState();
}

class _SampleScreenState extends State<SampleScreen>
    with SingleTickerProviderStateMixin {
  // late TabController _controller;
  late final TabController _controller = TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _controller,
          tabs: const [
            Tab(
              text: 'First',
            ),
            Tab(
              text: 'Second',
            ),
            Tab(
              text: 'Third',
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ClipPath(
              clipper: CustomClip(),
              child: Container(
                height: 70,
                width: MediaQuery.sizeOf(context).width * 0.6,
                color: Colors.purple,
                alignment: Alignment.center,
                child: const Text(
                  'Proceed',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double offset = 40;
    double slant = offset / 6; //edit the 6 for more slant
    path.moveTo(offset, 0);
    path.arcToPoint(
      Offset(offset, size.height),
      radius: const Radius.circular(10),
      clockwise: false,
    );
    path.lineTo(size.width - offset, size.height);
    path.arcToPoint(
      Offset(size.width - offset, slant),
      radius: const Radius.circular(10),
      clockwise: false,
    );

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
