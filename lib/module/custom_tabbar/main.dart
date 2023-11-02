import 'package:flutter/material.dart';

class CustomTabbar extends StatefulWidget {
  const CustomTabbar({super.key});

  @override
  State<CustomTabbar> createState() => _CustomTabbarState();
}

class _CustomTabbarState extends State<CustomTabbar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        // backgroundColor: Colors.black38,
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.5,
          backgroundColor: Colors.black38,
          bottom: const TabBar(
            labelStyle: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
            unselectedLabelStyle: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
            indicatorSize: TabBarIndicatorSize.label,
            isScrollable: true,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
            indicatorWeight: 4,
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                text: 'Pizza',
              ),
              Tab(
                text: 'Burger',
              ),
              Tab(
                text: 'Sushi',
              ),
              Tab(
                text: 'Kebab',
              ),
              Tab(
                text: 'Sandwich',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: List.generate(
            5,
            (index) => ListView(
              padding: const EdgeInsets.only(
                left: 30,
                top: 30,
                bottom: 30,
              ),
              scrollDirection: Axis.horizontal,
              children: List.generate(
                20,
                (index) => const FoodCard(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  const FoodCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      width: 200,
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: FoodCardPainter(),
            ),
          ),
          Positioned(
            right: -15,
            top: 211,
            child: Container(
              width: 77,
              height: 77,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              padding: const EdgeInsets.all(20),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: const Icon(
                  Icons.lock,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FoodCardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    var paint = Paint()..color = Colors.grey;
    double offset = 30;
    double smallOffset = 16;

    path.moveTo(0, offset);
    path.lineTo(0, size.height - offset);
    path.quadraticBezierTo(0, size.height, offset, size.height);
    path.lineTo(size.width - smallOffset, size.height);

    // Tried to paint it but didn't fully work, so, I had to find a way around it

    // This is only a "HACK AROUND" because there wasn't much time

    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width,
      size.height - 10 / 2,
    );
    path.quadraticBezierTo(
      size.width,
      size.height - 10,
      size.width - smallOffset,
      size.height - 10,
    );

    path.lineTo(
      size.width - smallOffset,
      size.height - 10,
    );

    path.lineTo(
      size.width - offset,
      size.height - 10 - 75,
    );

    path.quadraticBezierTo(
      size.width,
      size.height - 10 - 75,
      size.width,
      size.height - 10 - 75 - offset,
    );

    path.lineTo(size.width, offset);
    path.quadraticBezierTo(size.width, 0, size.width - offset, 0);
    path.lineTo(offset, 0);
    path.quadraticBezierTo(0, 0, 0, offset);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
