import 'package:flutter/material.dart';

class TextBorder extends StatefulWidget {
  const TextBorder({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<TextBorder> createState() => _TextBorderState();
}

class _TextBorderState extends State<TextBorder> {
  late FocusNode focusNode;
  bool show = false;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode()
      ..addListener(() {
        if (focusNode.hasFocus) {
          show = true;
        } else {
          show = false;
        }
        setState(() {});
      });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  Widget yourContent() => Container(
        color: Colors.red,
        width: 100,
        height: 50,
      );

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
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 70,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 10,
                        child: Text(
                          'Connect Manager  ',
                          style: TextStyle(
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 70,
                  child: Stack(
                    children: [
                      Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        shadowColor: Colors.black,
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          child: Center(
                            child: TextField(
                              focusNode: focusNode,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (show)
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 3,
                            width: MediaQuery.sizeOf(context).width * 0.78,
                            decoration: ShapeDecoration(
                              color: Colors.cyan,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  runSpacing: 20,
                  children: [
                    for (int i = 0; i < 18; i++)
                      if (i.isOdd)
                        const SizedBox(
                          width: 100,
                        )
                      else
                        yourContent(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
