import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tests/module/animated_video/main.dart';
import 'package:tests/module/camera_app/main.dart';
import 'package:tests/module/custom_bottom_nav_bar/main.dart';
import 'package:tests/module/flow/main.dart';
import 'package:tests/module/food_animation/main.dart';
import 'package:tests/module/gradient_tab/main.dart';
import 'package:tests/module/network/main.dart';
import 'package:tests/module/sample/main.dart';
import 'package:tests/module/sun_earth_moon/main.dart';

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

  runApp(const ProviderScope(child: MyApp()));
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
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const HelperApp(),
          );
        });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Helper Project'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Animated Video'),
            onTap: () => goToScreen(
              const AnimatedVideo(),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Camera Circle'),
            onTap: () => goToScreen(
              const CameraApp(),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Catheral Door'),
            onTap: () => goToScreen(
              const CathedralDoor(),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Change State'),
            onTap: () => goToScreen(
              const ChangeState(),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Curvy Card'),
            onTap: () => goToScreen(
              const CurvyCard(),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Custom Bottom Nav Bar'),
            onTap: () => goToScreen(
              const CustomBottomNavBar(),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Custom Dialog'),
            onTap: () => goToScreen(
              const CustomDialog(),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Custom Tabbar'),
            onTap: () => goToScreen(
              const CustomTabbar(),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Flow Example'),
            onTap: () => goToScreen(
              const FlowExample(),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Food Animation'),
            onTap: () => goToScreen(
              const FoodAnimation(),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Glowing Arc'),
            onTap: () => goToScreen(
              const GlowingArc(),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Glowing Circle'),
            onTap: () => goToScreen(
              const GradientCircle(),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Gradient Tab'),
            onTap: () => goToScreen(
              const GradientTab(),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('List Selection'),
            onTap: () => goToScreen(
              const ListSelection(),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Loader Increase'),
            onTap: () => goToScreen(
              const LoaderIncrease(),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Loop Path'),
            onTap: () => goToScreen(
              const LoopPath(),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Network Screen'),
            onTap: () => goToScreen(
              const NetworkScreen(),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Overlap Arc'),
            onTap: () => goToScreen(
              const OverlapArc(),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Picker Num'),
            onTap: () => goToScreen(
              const PickerNum(),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Sample'),
            onTap: () => goToScreen(
              const SampleScreen(),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Sharp Curve'),
            onTap: () => goToScreen(
              const SharpCurve(),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Slider Hover'),
            onTap: () => goToScreen(
              const SliderHover(),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Smart Design'),
            onTap: () => goToScreen(
              const SmartDesign(),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Spinner'),
            onTap: () => goToScreen(
              const Spinner(),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Spiral Image'),
            onTap: () => goToScreen(
              const SpiralImage(),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Sun Earth Moon'),
            onTap: () => goToScreen(
              const SunEarthMoon(),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Switch Animation'),
            onTap: () => goToScreen(
              const SwitchAnimation(),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Text Border'),
            onTap: () => goToScreen(
              const SwitchAnimation(),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Ticket Card'),
            onTap: () => goToScreen(
              const TicketCard(),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Wavy Clip'),
            onTap: () => goToScreen(
              const WavyClip(),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Wrapped Order'),
            onTap: () => goToScreen(
              const WrappedOrder(),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Zig Zag'),
            onTap: () => goToScreen(
              const ZigZag(),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
