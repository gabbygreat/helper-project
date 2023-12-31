import 'package:flutter/material.dart';

class FlowExample extends StatelessWidget {
  const FlowExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flow Widget Example'),
        ),
        body: const MyFlowWidget(),
      ),
    );
  }
}

class MyFlowWidget extends StatelessWidget {
  const MyFlowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: MyFlowDelegate(),
      children: const [
        // Your list of children widgets
        MyFlowItemWidget('Item 1'),
        MyFlowItemWidget('Item 2'),
        MyFlowItemWidget('Item 3'),
        MyFlowItemWidget('Item 4'),
        MyFlowItemWidget('Item 5'),
      ],
    );
  }
}

class MyFlowItemWidget extends StatelessWidget {
  final String text;

  const MyFlowItemWidget(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.red,
        ),
       ),
    );
  }
}

class MyFlowDelegate extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    // Implement custom painting if needed
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return false;
  }
}
