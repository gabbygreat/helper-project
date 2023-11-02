import 'package:flutter/material.dart';
import 'extension.dart';

import 'utils.dart';

class SmartDesign extends StatefulWidget {
  const SmartDesign({super.key});

  @override
  State<SmartDesign> createState() => _SmartDesignState();
}

class _SmartDesignState extends State<SmartDesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          const FirstComponent(),
          const SecondComponent(),
          const ThirdComponent(),
          10.sbH,
          const Expanded(
            child: FourthComponent(),
          ),
          const FifthComponent(),
        ],
      ),
    );
  }
}

class FirstComponent extends StatelessWidget {
  const FirstComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.getSize.height * 0.2,
      decoration: BoxDecoration(
        color: AppColor.blueColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(60),
          bottomRight: Radius.circular(60),
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ClipPath(
                  clipper: RightTopCurve(),
                  child: Container(
                    width: context.getSize.height * 0.09,
                    height: context.getSize.height * 0.25 * 0.2,
                    color: AppColor.green,
                  ),
                ),
                ClipPath(
                  clipper: LeftTopCurve(),
                  child: Container(
                    width: context.getSize.height * 0.09,
                    height: context.getSize.height * 0.25 * 0.8,
                    color: AppColor.black,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Good Morning,',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          'Welcome to smart home',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.black,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LeftTopCurve extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width, 0);
    path.quadraticBezierTo(
        size.width * 0.8, size.height * 0.5, 0, size.height * 0.7);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class RightTopCurve extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width * 0.52, 0);
    path.quadraticBezierTo(size.width * 0.6, size.height * 0.6, 0, size.height);
    path.lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class SecondComponent extends StatelessWidget {
  const SecondComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.getSize.height * 0.18,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: AppColor.green,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(60),
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                ),
              ),
              child: Column(
                children: [
                  const Expanded(
                    child: SizedBox.shrink(),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            bottom: 10,
                            left: 10,
                          ),
                          width: 80,
                          decoration: BoxDecoration(
                            color: AppColor.black,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.remove,
                              color: AppColor.white.withOpacity(0.5),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            bottom: 10,
                            right: 10,
                          ),
                          width: 80,
                          decoration: BoxDecoration(
                            color: AppColor.black,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: AppColor.white.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 100,
            child: Stack(
              children: [
                Container(
                  height: context.getSize.height * 0.06,
                  width: context.getSize.height * 0.06,
                  color: AppColor.green,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: context.getSize.height * 0.03,
                    width: context.getSize.height * 0.03,
                    color: AppColor.yellow,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.green,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.black,
                        ),
                        child: Icon(
                          Icons.power_settings_new,
                          size: 50,
                          color: AppColor.green.withOpacity(0.6),
                        ),
                      ),
                    ),
                    Container(
                      height: 60,
                      width: 100,
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: AppColor.yellow,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColor.grey,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ThirdComponent extends StatelessWidget {
  const ThirdComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.getSize.height * 0.28,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'GABBY',
                  style: TextStyle(
                    color: AppColor.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                  ),
                ),
                Text(
                  'GREAT',
                  style: TextStyle(
                    color: AppColor.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
          10.sbW,
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.yellow,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(60),
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FourthComponent extends StatelessWidget {
  const FourthComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.getSize.height * 0.22,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.purple,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Hello World',
                          style: TextStyle(
                            color: AppColor.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Hello World',
                          style: TextStyle(
                            color: AppColor.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 5,
                        right: 5,
                        bottom: 5,
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.black,
                        borderRadius: BorderRadius.circular(60),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          10.sbW,
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.grey,
                borderRadius: BorderRadius.circular(60),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FifthComponent extends StatefulWidget {
  const FifthComponent({super.key});

  @override
  State<FifthComponent> createState() => _FifthComponentState();
}

class _FifthComponentState extends State<FifthComponent> {
  var position = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            Expanded(
              child: NavButton(
                groupPosition: position,
                index: 1,
                icon: Icons.home,
                text: 'Home',
                onTap: (index) => setState(() => position = index),
              ),
            ),
            Expanded(
              child: NavButton(
                groupPosition: position,
                index: 2,
                icon: Icons.home,
                text: 'Home',
                onTap: (index) => setState(() => position = index),
              ),
            ),
            Expanded(
              child: NavButton(
                groupPosition: position,
                index: 3,
                icon: Icons.home,
                text: 'Home',
                onTap: (index) => setState(() => position = index),
              ),
            ),
            Expanded(
              child: NavButton(
                groupPosition: position,
                index: 4,
                icon: Icons.home,
                text: 'Home',
                onTap: (index) => setState(() => position = index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavButton extends StatelessWidget {
  final int index;
  final int groupPosition;
  final IconData icon;
  final String text;
  final void Function(int) onTap;
  const NavButton({
    super.key,
    required this.groupPosition,
    required this.index,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: 45,
        decoration: BoxDecoration(
          color: groupPosition == index ? AppColor.green : Colors.transparent,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: groupPosition == index ? AppColor.black : AppColor.grey,
            ),
            if (groupPosition == index) ...[
              5.sbW,
              Text(
                'Home',
                style: TextStyle(
                  color: AppColor.black,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
