import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
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
        title: const Text('Text Border'),
      ),
      backgroundColor: Colors.grey,
      body: Stack(
        children: [
          Positioned.fill(
            child: ListView.builder(
              itemBuilder: (context, index) => const ListTile(
                title: Text('Hello'),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // BEGIN FOR DEV-SCIENTIST
                SizedBox(
                  height: 120,
                  child: Stack(
                    children: [
                      ClipPath(
                        clipper: SunkenClipper(),
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                      const Align(
                        alignment: Alignment.topCenter,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.blue,
                          child: Icon(
                            Icons.shopify_rounded,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.home_outlined,
                                  size: 30,
                                  color: Colors.grey,
                                ),
                                Icon(
                                  Icons.favorite_outline,
                                  size: 30,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 90,
                                ),
                                Icon(
                                  Icons.notifications_outlined,
                                  size: 30,
                                  color: Colors.grey,
                                ),
                                Icon(
                                  Icons.person_outline,
                                  size: 30,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                // END FOR DEV-SCIENTIST

                Builder(builder: (context) {
                  double height = 150;
                  double circleHeight = 80;
                  double pad = 5;

                  ///No touch
                  double heightFactor =
                      ((((height - (circleHeight / 2)) * 100) / height)) / 100;
                  return SizedBox(
                    height: height,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: FractionallySizedBox(
                            heightFactor: heightFactor,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ...[
                                    Icon(
                                      Icons.abc,
                                      color: Colors.blue,
                                    ),
                                    Icon(
                                      Icons.abc,
                                      color: Colors.blue,
                                    ),
                                  ],
                                  SizedBox(
                                    width: 30,
                                  ),
                                  ...[
                                    Icon(
                                      Icons.abc,
                                      color: Colors.blue,
                                    ),
                                    Icon(
                                      Icons.abc,
                                      color: Colors.blue,
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: circleHeight,
                            width: circleHeight,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            padding: EdgeInsets.all(pad),
                            child: const CircleAvatar(),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SunkenClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double offset = 25; //Adjust this 25 for the border

    path.quadraticBezierTo(
      (size.width / 2 - (2 * offset)) / 2,
      offset + 5,
      size.width / 2 - (2 * offset) - offset,
      offset,
    );
    path.quadraticBezierTo(
      size.width / 2 - (2 * offset),
      offset,
      size.width / 2 - (2 * offset),
      offset + 20,
    );
    path.lineTo(
      size.width / 2 - (2 * offset),
      size.height * 0.6 - offset,
    );
    path.quadraticBezierTo(
      size.width / 2 - (2 * offset),
      size.height * 0.6,
      size.width / 2 - (2 * offset) + offset,
      size.height * 0.6,
    );
    path.lineTo(
      size.width / 2 + (2 * offset) - offset,
      size.height * 0.6,
    );
    path.quadraticBezierTo(
      size.width / 2 + (2 * offset),
      size.height * 0.6,
      size.width / 2 + (2 * offset),
      size.height * 0.6 - offset,
    );
    path.lineTo(
      size.width / 2 + (2 * offset),
      offset + offset,
    );
    path.quadraticBezierTo(
      size.width / 2 + (2 * offset),
      offset,
      size.width / 2 + (2 * offset) + offset,
      offset,
    );
    path.quadraticBezierTo(
      (size.width / 2 - (2 * offset)) * 2,
      offset + 5,
      size.width,
      0,
    );
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class CirclePath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    // double length = 32; //Adjust this 32 for the deep sink
    double offset = 15; //Adjust this 50 for the border
    double height = size.height * 0.32;
    double circleWidth = 50;

    path.moveTo(0, height);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, height + offset);
    path.quadraticBezierTo(
      size.width,
      height,
      size.width - offset,
      height,
    );
    path.lineTo(size.width / 2 + circleWidth, height);
    path.quadraticBezierTo(
      size.width / 2 + circleWidth,
      0,
      size.width / 2,
      0,
    );
    path.quadraticBezierTo(
      size.width / 2 - circleWidth,
      0,
      size.width / 2 - circleWidth,
      height,
    );
    path.lineTo(size.width / 2 - circleWidth, height);
    path.lineTo(offset, height);
    path.quadraticBezierTo(
      0,
      height,
      0,
      height + offset,
    );
    // path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
