import 'package:flutter/material.dart';

class SwitchAnimation extends StatefulWidget {
  const SwitchAnimation({super.key});
  @override
  State<SwitchAnimation> createState() => _SwitchAnimationState();
}

class _SwitchAnimationState extends State<SwitchAnimation> {
  bool lightOn = true;
  final gradient = const [
    Color(0xFF696969),
    Color(0xFF484848),
    Color(0xFF3D3D3D)
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0XFF383838),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.green,
        ),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(24),
          height: size.width / 1.5,
          width: size.width / 1.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: const Color(0XFF4E4E4E),
          ),
          child: Container(
            margin: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 3),
              borderRadius: BorderRadius.circular(20),
              color: const Color(0XFF2D2D2D),
            ),
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () => setState(() {
                    lightOn = !lightOn;
                  }),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: lightOn
                        ? const EdgeInsets.only(top: 20)
                        : const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color(0xFF6F6F6F), width: 0.5),
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: lightOn ? gradient : gradient.reversed.toList(),
                        stops: const [0, 0.5, 1.0],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF3D3D3D),
                          offset: Offset(0, lightOn ? -8 : 8),
                          blurRadius: 5,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 200),
                  right: 15,
                  top: lightOn ? 35 : 15,
                  child: Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: lightOn
                          ? const Color(0xFF36EA69)
                          : const Color(0xFFE84A36),
                      boxShadow: [
                        BoxShadow(
                          color: lightOn
                              ? const Color(0XFF43A45D)
                              : const Color(0XFF9B4236),
                          offset: const Offset(0, 0),
                          blurRadius: 5,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
