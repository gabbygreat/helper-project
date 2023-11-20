import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<String> sendFakeName({
  required String name,
  required WidgetRef ref,
}) async {
  /// Set your state provider to true
  /// This will fire your listeners
  /// That is why the stateprovider is a global
  /// variable, so, you can fire it from anywhere
  ref.read(sendingState.notifier).state = true;

  /// Imitate a fake API request
  await Future.delayed(const Duration(seconds: 2));
  /// Uncomment the next line to imitate a failed request
  // throw const SocketException('message');
  /// Set your provider back to false
  /// Since the request is successful
  ref.read(sendingState.notifier).state = false;
  return 'Done';
}

/// Here's your global state provider
/// Keep in mind that it has to be global
/// Just so you can access it from anywhere
final sendingState = StateProvider((ref) => false);

class SampleScreen extends ConsumerStatefulWidget {
  const SampleScreen({super.key});

  @override
  ConsumerState<SampleScreen> createState() => _SampleScreenState();
}

class _SampleScreenState extends ConsumerState<SampleScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  /// The button callback
  void makeRequest() {
    sendFakeName(
      name: _controller.text,
      ref: ref,
    ).then(
      (value) {
        if (!mounted) return null;
        return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Success'),
            backgroundColor: Colors.green,
          ),
        );
      },
    ).catchError((err) {
      if (!mounted) return null;
      ref.read(sendingState.notifier).state = false;
      return ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed'),
          backgroundColor: Colors.red,
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// This is listening to your state privider
    /// The koko
    /// But, for your use case, this will be in the root widget
    ref.listen(sendingState, (prev, next) {
      if (next) {
        showAdaptiveDialog(
          context: context,
          builder: (context) => const Dialog(
            child: CircularProgressIndicator.adaptive(),
          ),
        );
      } else {
        if (mounted) {
          Navigator.of(context).pop();
        }
      }
    });
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: TextField(
              controller: _controller,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
              onPressed: makeRequest,
              child: const Text("send"),
            ),
          ),
        ],
      ),
    );
  }
}
