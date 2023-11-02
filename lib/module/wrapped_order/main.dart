import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension GroupStringsExtension on List<String> {
  List<List<String>> groupStrings() {
    List<List<String>> result = [];

    if (isNotEmpty) {
      result.add([this[0]]);
    }

    for (int i = 1; i < length - 1; i += 2) {
      result.add([this[i], this[i + 1]]);
    }

    if (length > 1) {
      result.add([last]);
    }

    return result;
  }
}

class WrappedOrder extends StatefulWidget {
  const WrappedOrder({super.key});

  @override
  State<WrappedOrder> createState() => _WrappedOrderState();
}

class _WrappedOrderState extends State<WrappedOrder> {
  var content = [
    'Discovery Recipes',
    'Easy fit',
    'Groceries',
    'Good fats',
    'Veges',
    'International',
    'International',
    'International',
  ];

  var position = 0;

  @override
  Widget build(BuildContext context) {
    assert(content.length.isEven, 'Must be Even');
    var groupedContent = content.groupStrings();
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 227, 219, 219),
          appBar: AppBar(
            title: const Text('Wrapped Order'),
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(
              Icons.play_arrow,
            ),
            onPressed: () {
              if (position == 3) {
                position = 0;
              } else {
                position += 1;
              }
              setState(() {});
            },
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i in groupedContent)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: i
                        .map((e) => Container(
                              margin: EdgeInsets.only(
                                right:
                                    !groupedContent.indexOf(i).isEven ? 10 : 0,
                                left: groupedContent.indexOf(i).isEven ? 10 : 0,
                                bottom: 15,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.red,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 10,
                                ),
                                alignment: Alignment.center,
                                child: Row(
                                  children: [
                                    const CircleAvatar(),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(e),
                                  ],
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                Center(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    height: 15,
                    decoration: BoxDecoration(
                      color: Colors.red.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.centerLeft,
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      height: 15,
                      width: MediaQuery.sizeOf(context).width *
                          0.8 *
                          (position / 3),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
