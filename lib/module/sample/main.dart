import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



Future<String> sendFakeName({
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
  /// The button callback
  void makeRequest() {
    sendFakeName(
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
  Widget build(BuildContext context) {
    /// This is listening to your state privider
    /// The koko
    /// But, for your use case, this will be in the root widget
    ref.listen(sendingState, (prev, next) {
      if (next) {
        /// Show that loading dialog
        showAdaptiveDialog(
          /// Since we don't want the barrier to be dissmissable
          barrierDismissible: false,
          context: context,
          builder: (context) => const Dialog(
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            child: CircularProgressIndicator.adaptive(),
          ),
        );
      } else {
        /// Pop the loading modal
        if (mounted) {
          /// You can go to another screen if you want, it's your choice
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
