import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({super.key});

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  Future<T?> showIosDialog<T>() async {
    return showDialog(
      context: context,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Material(
                color: Colors.transparent,
                child: Container(
                  decoration: ShapeDecoration(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 15,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        '👍',
                        style: TextStyle(fontSize: 25),
                      ).animate().fade(duration: 110.ms).scale(delay: 110.ms),
                      10.horizontalSpace,
                      const Text(
                        '❤️',
                        style: TextStyle(fontSize: 25),
                      ).animate().fade(duration: 120.ms).scale(delay: 120.ms),
                      10.horizontalSpace,
                      const Text(
                        '😂',
                        style: TextStyle(fontSize: 25),
                      ).animate().fade(duration: 130.ms).scale(delay: 130.ms),
                      10.horizontalSpace,
                      const Text(
                        '😮',
                        style: TextStyle(fontSize: 25),
                      ).animate().fade(duration: 140.ms).scale(delay: 140.ms),
                      10.horizontalSpace,
                      const Text(
                        '😢',
                        style: TextStyle(fontSize: 25),
                      ).animate().fade(duration: 150.ms).scale(delay: 150.ms),
                      10.horizontalSpace,
                      const Text(
                        '🙏',
                        style: TextStyle(fontSize: 25),
                      ).animate().fade(duration: 160.ms).scale(delay: 160.ms),
                      10.horizontalSpace,
                      const CircleAvatar(
                        radius: 18,
                        child: Icon(
                          Icons.add,
                        ),
                      ).animate().fade(duration: 170.ms).scale(delay: 170.ms)
                    ],
                  ),
                ).animate().fade(duration: 100.ms).scale(delay: 100.ms),
              ),
              5.verticalSpace,
              const Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Text(
                    'IOS dialog',
                  ),
                ),
              ),
              5.verticalSpace,
              Material(
                color: Colors.transparent,
                child: Container(
                  width: 250,
                  decoration: ShapeDecoration(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Star',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.star_border,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        height: 0,
                        thickness: 0.5,
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Reply',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.reply,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        height: 0,
                        thickness: 0.5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 8,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Forward',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationY(pi),
                              child: const Icon(
                                Icons.reply,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        height: 0,
                        thickness: 0.5,
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Copy',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.copy,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        height: 0,
                        thickness: 0.5,
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Report',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.warning,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        height: 0,
                        thickness: 0.5,
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delete',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                            Icon(
                              Icons.delete,
                              color: Colors.red,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ).animate().fade(duration: 160.ms).scale(delay: 160.ms)
            ],
          ),
        ),
      ),
    );
  }

  Future<T?> showClippedDialog<T>() async {
    double circleRadius = 25;
    return showDialog(
      context: context,
      builder: (context) => Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 50),
          height: 400,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: CircleAvatar(
                  radius: circleRadius,
                  child: const Icon(
                    Icons.add,
                    size: 30,
                  ),
                ),
              ),
              Positioned.fill(
                child: ClipPath(
                  clipper: CurvedPath(circleRadius: circleRadius),
                  child: const Card(
                    margin: EdgeInsets.zero,
                    elevation: 0,
                    shape: Border(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('iPhone long press'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Wrap(
              children: [
                GestureDetector(
                  onTap: showIosDialog,
                  child: const Card(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      child: Text(
                        'IOS dialog',
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: showClippedDialog,
                  child: const Card(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      child: Text(
                        'Clipped Dialog',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CurvedPath extends CustomClipper<Path> {
  final double circleRadius;

  CurvedPath({required this.circleRadius});

  @override
  Path getClip(Size size) {
    var path = Path();
    double offset = 30;
    double length = 2 * circleRadius + 5;

    path.moveTo(0, offset + circleRadius);
    path.lineTo(0, size.height - offset);
    path.quadraticBezierTo(0, size.height, offset, size.height);
    path.lineTo(size.width - offset, size.height);
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width,
      size.height - offset,
    );
    path.lineTo(size.width, offset + 25);
    path.quadraticBezierTo(
      size.width,
      circleRadius,
      size.width - offset,
      circleRadius,
    );
    path.lineTo((size.width / 2) + circleRadius + 10 + 5, circleRadius);
    path.cubicTo(
      size.width * 0.58,
      circleRadius,
      size.width * 0.6,
      length,
      size.width * 0.5,
      length,
    );
    path.cubicTo(
      size.width * 0.42,
      length,
      size.width * 0.4,
      circleRadius,
      size.width * 0.36,
      circleRadius,
    );
    path.lineTo(offset, circleRadius);
    path.quadraticBezierTo(0, circleRadius, 0, offset + circleRadius);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
