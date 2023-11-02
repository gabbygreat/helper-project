import 'package:flutter/material.dart';

class LoaderIncrease extends StatefulWidget {
  const LoaderIncrease({super.key});

  @override
  State<LoaderIncrease> createState() => _LoaderIncreaseState();
}

class _LoaderIncreaseState extends State<LoaderIncrease>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late Animation<double> animation2;
  late AnimationController controller;
  late AnimationController controller2;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    controller2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    );
    animation = Tween<double>(begin: 0, end: 10).animate(controller);
    animation2 = Tween<double>(begin: 0, end: 100).animate(controller2);
    controller.addListener(() => setState(() {}));
    controller2.addListener(() => setState(() {}));

    controller.repeat();
    controller2.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: const Text(
          'Demo ',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    alignment:
                        animation.value.toInt() >= 0 && animation.value < 1
                            ? Alignment.topCenter
                            : Alignment.center,
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const SweepGradient(
                          colors: [
                            Colors.purple,
                            Colors.blue,
                          ],
                        ).createShader(bounds);
                      },
                      child: const Text(
                        'L',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    alignment:
                        animation.value.toInt() >= 0.1 && animation.value < 2
                            ? Alignment.topCenter
                            : Alignment.center,
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const SweepGradient(
                          colors: [
                            Colors.purple,
                            Colors.blue,
                          ],
                        ).createShader(bounds);
                      },
                      child: const Text(
                        'o',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    alignment:
                        animation.value.toInt() >= 1.1 && animation.value < 3
                            ? Alignment.topCenter
                            : Alignment.center,
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const SweepGradient(
                          colors: [
                            Colors.purple,
                            Colors.blue,
                          ],
                        ).createShader(bounds);
                      },
                      child: const Text(
                        'a',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    alignment:
                        animation.value.toInt() >= 2.1 && animation.value < 4
                            ? Alignment.topCenter
                            : Alignment.center,
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const SweepGradient(
                          colors: [
                            Colors.purple,
                            Colors.blue,
                          ],
                        ).createShader(bounds);
                      },
                      child: const Text(
                        'd',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    alignment:
                        animation.value.toInt() >= 3.1 && animation.value < 5
                            ? Alignment.topCenter
                            : Alignment.center,
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const SweepGradient(
                          colors: [
                            Colors.purple,
                            Colors.blue,
                          ],
                        ).createShader(bounds);
                      },
                      child: const Text(
                        'i',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    alignment:
                        animation.value.toInt() >= 4.1 && animation.value < 6
                            ? Alignment.topCenter
                            : Alignment.center,
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const SweepGradient(
                          colors: [
                            Colors.purple,
                            Colors.blue,
                          ],
                        ).createShader(bounds);
                      },
                      child: const Text(
                        'n',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    alignment:
                        animation.value.toInt() >= 5.1 && animation.value < 7
                            ? Alignment.topCenter
                            : Alignment.center,
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const SweepGradient(
                          colors: [
                            Colors.purple,
                            Colors.blue,
                          ],
                        ).createShader(bounds);
                      },
                      child: const Text(
                        'g',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    alignment:
                        animation.value.toInt() >= 6.1 && animation.value < 8
                            ? Alignment.topCenter
                            : Alignment.center,
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const SweepGradient(
                          colors: [
                            Colors.purple,
                            Colors.blue,
                          ],
                        ).createShader(bounds);
                      },
                      child: const Text(
                        '.',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    alignment:
                        animation.value.toInt() >= 7.1 && animation.value < 9
                            ? Alignment.topCenter
                            : Alignment.center,
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const SweepGradient(
                          colors: [
                            Colors.purple,
                            Colors.blue,
                          ],
                        ).createShader(bounds);
                      },
                      child: const Text(
                        '.',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    alignment:
                        animation.value.toInt() >= 8.1 && animation.value < 10
                            ? Alignment.topCenter
                            : Alignment.center,
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          colors: [
                            Colors.purple,
                            Colors.blue,
                          ],
                        ).createShader(bounds);
                      },
                      child: const Text(
                        '.',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
              width: MediaQuery.sizeOf(context).width * 0.6,
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.blue,
                          Colors.purple,
                        ],
                      ),
                    ),
                    width: ((MediaQuery.sizeOf(context).width * 0.6) - 10) *
                        animation2.value /
                        100,
                  ),
                  Container(
                    height: 5,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.purple,
                          Colors.blue,
                        ],
                      ),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    color: Colors.purple,
                    width: 5,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      color: Colors.blue,
                      width: 5,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.purple,
                            Colors.blue,
                          ],
                        ),
                      ),
                      height: 5,
                    ),
                  ),
                ],
              ),
            ),
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [
                    Colors.purple,
                    Colors.blue,
                  ],
                ).createShader(bounds);
              },
              child: Text(
                '${animation2.value.toInt()} %',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
