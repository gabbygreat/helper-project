import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tests/resources/resources.dart';

class FoodModel {
  String foodName;
  String foodDescription;
  int foodStar;
  num foodTemperature;
  Color backgroundColor;
  String image;

  FoodModel({
    required this.foodDescription,
    required this.foodName,
    required this.foodStar,
    required this.foodTemperature,
    required this.backgroundColor,
    required this.image,
  });
}

class FoodAnimation extends StatefulWidget {
  const FoodAnimation({super.key});

  @override
  State<FoodAnimation> createState() => _FoodAnimationState();
}

class _FoodAnimationState extends State<FoodAnimation>
    with TickerProviderStateMixin {
  late List<FoodModel> foodList;
  late AnimationController _animationController;
  late Animation<double> _animation;
  final currentIndex = ValueNotifier(0);

  Color getRandomColor() {
    final random = Random();
    int red = random.nextInt(256);
    int green = random.nextInt(256);
    int blue = random.nextInt(256);
    return Color.fromARGB(255, red, green, blue);
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      reverseDuration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.bounceOut,
        reverseCurve: Curves.bounceIn,
      ),
    );

    foodList = [
      FoodModel(
        foodName: 'Pizza',
        foodDescription: 'Delicious pizza with various toppings',
        foodStar: 5,
        foodTemperature: 200,
        backgroundColor: getRandomColor(),
        image: AppImages.food1,
      ),
      FoodModel(
        foodName: 'Burger',
        foodDescription: 'Classic burger with juicy patty',
        foodStar: 4,
        foodTemperature: 150,
        backgroundColor: getRandomColor(),
        image: AppImages.food4,
      ),
      FoodModel(
        foodName: 'Salad',
        foodDescription: 'Fresh and healthy salad',
        foodStar: 3,
        foodTemperature: 25,
        backgroundColor: getRandomColor(),
        image: AppImages.food3,
      ),
      FoodModel(
        foodName: 'Sushi',
        foodDescription: 'Japanese delicacy with raw fish',
        foodStar: 4,
        foodTemperature: 18,
        backgroundColor: getRandomColor(),
        image: AppImages.food2,
      ),
      FoodModel(
        foodName: 'Pasta',
        foodDescription: 'Italian pasta with rich tomato sauce',
        foodStar: 4,
        foodTemperature: 80,
        backgroundColor: getRandomColor(),
        image: AppImages.food1,
      ),
      FoodModel(
        foodName: 'Ice Cream',
        foodDescription: 'Sweet and creamy frozen dessert',
        foodStar: 5,
        foodTemperature: -10,
        backgroundColor: getRandomColor(),
        image: AppImages.food2,
      ),
      FoodModel(
        foodName: 'Steak',
        foodDescription: 'Grilled steak with savory seasoning',
        foodStar: 5,
        foodTemperature: 300,
        backgroundColor: getRandomColor(),
        image: AppImages.food3,
      ),
      FoodModel(
        foodName: 'Tacos',
        foodDescription: 'Mexican street food with flavorful fillings',
        foodStar: 4,
        foodTemperature: 120,
        backgroundColor: getRandomColor(),
        image: AppImages.food4,
      ),
      FoodModel(
        foodName: 'Chicken Curry',
        foodDescription: 'Spicy and aromatic chicken curry',
        foodStar: 4,
        foodTemperature: 90,
        backgroundColor: getRandomColor(),
        image: AppImages.food1,
      ),
      FoodModel(
        foodName: 'Fruit Smoothie',
        foodDescription: 'Refreshing smoothie with a mix of fruits',
        foodStar: 4,
        foodTemperature: 5,
        backgroundColor: getRandomColor(),
        image: AppImages.food2,
      ),
    ];
  }

  Widget image(String image) => Container(
        height: 160,
        width: 160,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 5,
            )
          ],
        ),
        child: Image.asset(image),
      );

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: const Color.fromARGB(255, 6, 36, 74),
        title: const Text(
          'Food Animation',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CarouselSlider.builder(
            itemCount: 10,
            itemBuilder: (context, index, pos) {
              final food = foodList[index];
              return GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SecondScreen(
                      food: food,
                    ),
                  ),
                ),
                child: ValueListenableBuilder<int>(
                  valueListenable: currentIndex,
                  builder: (context, current, _) {
                    return Container(
                      margin: EdgeInsets.only(left: 15.w),
                      padding: const EdgeInsets.only(top: 5),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: FractionallySizedBox(
                              heightFactor: 0.85,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: food.backgroundColor,
                                  borderRadius: BorderRadius.circular(40),
                                ),
                              ),
                            ),
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            alignment: index == current
                                ? Alignment.topCenter
                                : const Alignment(0, -0.5),
                            child: RotationTransition(
                              turns: _animation,
                              child: Hero(
                                tag: food,
                                flightShuttleBuilder: (
                                  BuildContext flightContext,
                                  Animation<double> animation,
                                  HeroFlightDirection flightDirection,
                                  BuildContext fromHeroContext,
                                  BuildContext toHeroContext,
                                ) {
                                  return RotationTransition(
                                    turns: animation,
                                    child: image(food.image),
                                  );
                                },
                                child: image(food.image),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: AnimatedFractionallySizedBox(
                              heightFactor: index == current ? 0.65 : 0.45,
                              duration: const Duration(milliseconds: 500),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      food.foodName,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    AnimatedOpacity(
                                      opacity: index == current ? 1 : 0,
                                      duration: const Duration(
                                        milliseconds: 1500,
                                      ),
                                      child: Text(
                                        food.foodDescription,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    20.verticalSpace,
                                    Row(
                                      children: [
                                        for (var i = 1; i <= food.foodStar; i++)
                                          AnimatedCrossFade(
                                            duration: const Duration(
                                              milliseconds: 1000,
                                            ),
                                            crossFadeState: index == current
                                                ? CrossFadeState.showSecond
                                                : CrossFadeState.showFirst,
                                            secondChild: const Icon(
                                              Icons.star,
                                              color: Colors.white,
                                            ),
                                            firstChild: AnimatedOpacity(
                                              opacity: 1,
                                              duration: Duration(seconds: i),
                                              child: const Icon(
                                                Icons.star,
                                                color: Colors.white38,
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                    10.verticalSpace,
                                    Text(
                                      '${food.foodTemperature}°C',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(),
                                    AnimatedCrossFade(
                                      crossFadeState: index == current
                                          ? CrossFadeState.showFirst
                                          : CrossFadeState.showSecond,
                                      duration:
                                          const Duration(milliseconds: 400),
                                      secondChild: const SizedBox.shrink(),
                                      firstChild: ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.thumb_up,
                                          color: Colors.black,
                                        ),
                                        label: const Text(
                                          'Like food',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    (index == current)
                                        ? 20.verticalSpace
                                        : 5.verticalSpace,
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              );
            },
            options: CarouselOptions(
              aspectRatio: 1,
              padEnds: false,
              height: MediaQuery.sizeOf(context).height * 0.55,
              viewportFraction: 0.65,
              enlargeFactor: 0.2,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                if (currentIndex.value < index) {
                  // FORWARD
                  _animationController.reset();
                  _animationController.forward();
                } else {
                  // BACKWARD
                  _animationController.value = 1;
                  _animationController.reverse();
                }
                currentIndex.value = index;
              },
            ),
          ),
          20.verticalSpace,
        ],
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  final FoodModel food;
  const SecondScreen({
    super.key,
    required this.food,
  });

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      reverseDuration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_animationController);
    _animationController.repeat();
    Future.delayed(const Duration(milliseconds: 500), () => showInfo());
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void showInfo() async {
    await showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      showDragHandle: true,
      context: context,
      backgroundColor: Colors.white,
      barrierColor: Colors.transparent,
      builder: (context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.food.foodName,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            10.verticalSpace,
            Row(
              children: [
                for (var i = 1; i <= widget.food.foodStar; i++)
                  const Icon(
                    Icons.star,
                    color: Colors.black,
                  )
              ],
            ),
            10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoSwitch(
                  value: true,
                  onChanged: (value) {},
                ),
                Text(
                  '\$${Random().nextInt(1000)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            10.verticalSpace,
            const Text(
              'About the food',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            10.verticalSpace,
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  widget.food.foodDescription +
                      widget.food.foodDescription +
                      widget.food.foodDescription +
                      widget.food.foodDescription +
                      widget.food.foodDescription +
                      widget.food.foodDescription +
                      widget.food.foodDescription +
                      widget.food.foodDescription +
                      widget.food.foodDescription +
                      widget.food.foodDescription +
                      widget.food.foodDescription +
                      widget.food.foodDescription,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                  child: const Icon(
                    Icons.shop,
                    color: Colors.grey,
                  ),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.food.backgroundColor,
                  ),
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                  label: const Text(
                    'Add to cart',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            30.verticalSpace,
          ],
        ),
      ),
    );
    Future.delayed(
      const Duration(milliseconds: 500),
      () => Navigator.of(context).pop(),
    );
  }

  Widget image() => Container(
        height: 160,
        width: 160,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 5,
            )
          ],
        ),
        child: Image.asset(widget.food.image),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.food.backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Column(children: [
        100.verticalSpace,
        Center(
          child: Hero(
            tag: widget.food,
            flightShuttleBuilder: (
              BuildContext flightContext,
              Animation<double> animation,
              HeroFlightDirection flightDirection,
              BuildContext fromHeroContext,
              BuildContext toHeroContext,
            ) {
              return RotationTransition(
                turns: animation,
                child: image(),
              );
            },
            child: RotationTransition(
              turns: _animation,
              child: image(),
            ),
          ),
        ),
      ]),
    );
  }
}
