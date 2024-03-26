import 'package:flutter/material.dart';

class GradientTab extends StatefulWidget {
  const GradientTab({super.key});

  @override
  State<GradientTab> createState() => _GradientTabState();
}

class _GradientTabState extends State<GradientTab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Slider Hover'),
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: GradientUnderlineTabIndicator(
              width: 6,
              gradient: LinearGradient(
                colors: [
                  Colors.red,
                  Colors.orange,
                  Colors.yellow,
                  Colors.green,
                  Colors.indigo,
                  Colors.purple,
                ],
              ),
            ),
            tabs: [
              Tab(
                text: 'First',
              ),
              Tab(
                text: 'Second',
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Text('First Tab'),
            Text('Second Tab'),
          ],
        ),
      ),
    );
  }
}

class GradientUnderlineTabIndicator extends Decoration {
  final LinearGradient gradient;
  final double width;

  const GradientUnderlineTabIndicator({
    required this.gradient,
    this.width = 2.0,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _GradientPainter(this, onChanged);
  }
}

class _GradientPainter extends BoxPainter {
  final GradientUnderlineTabIndicator decoration;

  _GradientPainter(this.decoration, VoidCallback? onChanged) : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final rect = offset & configuration.size!;
    final Paint paint = Paint()
      ..shader = decoration.gradient.createShader(rect)
      ..strokeWidth = decoration.width
      ..strokeCap = StrokeCap.square;

    final Offset start = Offset(rect.left, rect.bottom);
    final Offset end = Offset(rect.right, rect.bottom);

    canvas.drawLine(start, end, paint);
  }
}