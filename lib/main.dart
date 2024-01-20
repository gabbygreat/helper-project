import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tests/module/animated_video/main.dart';
import 'package:tests/module/camera_app/main.dart';
import 'package:tests/module/custom_bottom_nav_bar/main.dart';
import 'package:tests/module/dark_mode/main.dart';
import 'package:tests/module/flow/main.dart';
import 'package:tests/module/food_animation/main.dart';
import 'package:tests/module/gradient_tab/main.dart';
import 'package:tests/module/network/main.dart';
import 'package:tests/module/sample/main.dart';
import 'package:tests/module/sun_earth_moon/main.dart';
import 'package:tests/module/x/main.dart';

import 'module/cathedral_door/main.dart';
import 'module/change_state/main.dart';
import 'module/curvy_card/main.dart';
import 'module/custom_tabbar/main.dart';
import 'module/glowing_arc/main.dart';
import 'module/gradient_circle/main.dart';
import 'module/custom_dialog/main.dart';
import 'module/list_selection/main.dart';
import 'module/loader_increase/main.dart';
import 'module/loop_path/main.dart';
import 'module/overlap_arc/main.dart';
import 'module/picker_num/main.dart';
import 'module/sharp_curve/main.dart';
import 'module/slider_hover/main.dart';
import 'module/smart_design/main.dart';
import 'module/spinner/main.dart';
import 'module/spiral_image/main.dart';
import 'module/switch_animation/main.dart';
import 'module/ticket_card/main.dart';
import 'module/wavy_clip/main.dart';
import 'module/wrapped_order/main.dart';
import 'module/zig_zag/main.dart';

late List<CameraDescription> cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();

  runApp(const ProviderScope(child: ThemedApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430.0, 932.0),
      builder: (context, _) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
            ),
            useMaterial3: true,
          ),
          home: const HelperApp(),
        );
      },
    );
  }
}

class HelperApp extends StatefulWidget {
  const HelperApp({super.key});

  @override
  State<HelperApp> createState() => _HelperAppState();
}

class _HelperAppState extends State<HelperApp> {
  void goToScreen(Widget child) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => child),
    );
  }

  Widget items({
    required String text,
    required Widget screen,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text(text),
          onTap: () => goToScreen(
            screen,
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
          ),
        ),
        const Divider(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Helper Project'),
      ),
      body: ListView(
        children: [
          items(
            screen: const AnimatedVideo(),
            text: 'Animated Video',
          ),
          items(
            screen: const CameraApp(),
            text: 'Camera Circle',
          ),
          items(
            screen: const CathedralDoor(),
            text: 'Catheral Door',
          ),
          items(
            screen: const ChangeState(),
            text: 'Change State',
          ),
          items(
            screen: const CurvyCard(),
            text: 'Curvy Card',
          ),
          items(
            screen: const CustomBottomNavBar(),
            text: 'Custom Bottom Nav Bar',
          ),
          items(
            screen: const CustomDialog(),
            text: 'Custom Dialog',
          ),
          items(
            screen: const CustomTabbar(),
            text: 'Custom Tabbar',
          ),
          items(
            screen: const ThemedApp(),
            text: 'Dark Mode',
          ),
          items(
            screen: const FlowExample(),
            text: 'Flow Example',
          ),
          items(
            screen: const FoodAnimation(),
            text: 'Food Animation',
          ),
          items(
            screen: const GlowingArc(),
            text: 'Glowing Arc',
          ),
          items(
            screen: const GradientCircle(),
            text: 'Glowing Circle',
          ),
          items(
            screen: const GradientTab(),
            text: 'Gradient Tab',
          ),
          items(
            screen: const ListSelection(),
            text: 'List Selection',
          ),
          items(
            screen: const LoaderIncrease(),
            text: 'Loader Increase',
          ),
          items(
            screen: const LoopPath(),
            text: 'Loop Path',
          ),
          items(
            screen: const NetworkScreen(),
            text: 'Network Screen',
          ),
          items(
            screen: const OverlapArc(),
            text: 'Overlap Arc',
          ),
          items(
            screen: const PickerNum(),
            text: 'Picker Num',
          ),
          items(
            screen: const SampleScreen(),
            text: 'Sample',
          ),
          items(
            screen: const SharpCurve(),
            text: 'Sharp Curve',
          ),
          items(
            screen: const SliderHover(),
            text: 'Slider Hover',
          ),
          items(
            screen: const SmartDesign(),
            text: 'Smart Design',
          ),
          items(
            screen: const Spinner(),
            text: 'Spinner',
          ),
          items(
            screen: const SpiralImage(),
            text: 'Spiral Image',
          ),
          items(
            screen: const SunEarthMoon(),
            text: 'Sun Earth Moon',
          ),
          items(
            screen: const SwitchAnimation(),
            text: 'Switch Animation',
          ),
          items(
            screen: const SwitchAnimation(),
            text: 'Text Border',
          ),
          items(
            screen: const TicketCard(),
            text: 'Ticket Card',
          ),
          items(
            screen: const WavyClip(),
            text: 'Wavy Clip',
          ),
          items(
            screen: const WrappedOrder(),
            text: 'Wrapped Order',
          ),
          items(
            screen: const ZigZag(),
            text: 'Zig Zag',
          ),
          items(
            screen: const AnimatedX(),
            text: 'AnimatedX',
          ),
        ],
      ),
    );
  }
}
