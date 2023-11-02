import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IosWhatsAppDialog extends StatefulWidget {
  const IosWhatsAppDialog({super.key});

  @override
  State<IosWhatsAppDialog> createState() => _IosWhatsAppDialogState();
}

class _IosWhatsAppDialogState extends State<IosWhatsAppDialog> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (context, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('iPhone long press'),
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
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
                                            borderRadius:
                                                BorderRadius.circular(100),
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
                                              style: TextStyle(fontSize: 30),
                                            )
                                                .animate()
                                                .fade(duration: 110.ms)
                                                .scale(delay: 110.ms),
                                            10.horizontalSpace,
                                            const Text(
                                              '❤️',
                                              style: TextStyle(fontSize: 30),
                                            )
                                                .animate()
                                                .fade(duration: 120.ms)
                                                .scale(delay: 120.ms),
                                            10.horizontalSpace,
                                            const Text(
                                              '😂',
                                              style: TextStyle(fontSize: 30),
                                            )
                                                .animate()
                                                .fade(duration: 130.ms)
                                                .scale(delay: 130.ms),
                                            10.horizontalSpace,
                                            const Text(
                                              '😮',
                                              style: TextStyle(fontSize: 30),
                                            )
                                                .animate()
                                                .fade(duration: 140.ms)
                                                .scale(delay: 140.ms),
                                            10.horizontalSpace,
                                            const Text(
                                              '😢',
                                              style: TextStyle(fontSize: 30),
                                            )
                                                .animate()
                                                .fade(duration: 150.ms)
                                                .scale(delay: 150.ms),
                                            10.horizontalSpace,
                                            const Text(
                                              '🙏',
                                              style: TextStyle(fontSize: 30),
                                            )
                                                .animate()
                                                .fade(duration: 160.ms)
                                                .scale(delay: 160.ms),
                                            10.horizontalSpace,
                                            const CircleAvatar(
                                              radius: 18,
                                              child: Icon(
                                                Icons.add,
                                              ),
                                            )
                                                .animate()
                                                .fade(duration: 170.ms)
                                                .scale(delay: 170.ms)
                                          ],
                                        ),
                                      )
                                          .animate()
                                          .fade(duration: 100.ms)
                                          .scale(delay: 100.ms),
                                    ),
                                    5.verticalSpace,
                                    const Card(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 8),
                                        child: Text(
                                          'An Example',
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
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 15, vertical: 8),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
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
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 15, vertical: 8),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
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
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 15,
                                                vertical: 8,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    'Forward',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Transform(
                                                    alignment: Alignment.center,
                                                    transform:
                                                        Matrix4.rotationY(pi),
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
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 15, vertical: 8),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
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
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 15, vertical: 8),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
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
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 15, vertical: 8),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
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
                                    )
                                        .animate()
                                        .fade(duration: 160.ms)
                                        .scale(delay: 160.ms)
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        child: const Card(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 8),
                            child: Text(
                              'An Example',
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
