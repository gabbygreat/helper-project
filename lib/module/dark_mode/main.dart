import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tests/module/dark_mode/context_extension.dart';
import 'package:tests/module/dark_mode/theme.dart';

import 'app_color.dart';

class ThemedApp extends StatefulWidget {
  const ThemedApp({super.key});

  @override
  State<ThemedApp> createState() => _ThemedAppState();
}

class _ThemedAppState extends State<ThemedApp> {
  var isDarkMode = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkMode,
      builder: (context, isDark, _) {
        return ScreenUtilInit(
          designSize: const Size(430.0, 932.0),
          builder: (context, _) {
            return MaterialApp(
              navigatorKey: navigator,
              themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
              theme: AppTheme.instance.lightTheme,
              darkTheme: AppTheme.instance.darkTheme,
              home: MainApp(isDarkMode: isDarkMode),
            );
          },
        );
      },
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
    required this.isDarkMode,
  });

  final ValueNotifier<bool> isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          20.verticalSpace,
          CupertinoSwitch(
            value: isDarkMode.value,
            onChanged: (value) => isDarkMode.value = value,
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              'Go back',
            ),
          ),
          Text(
            'BLACK IN LIGHT, RED IN DARK FROM HACKY',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: ThemeAppColor().reactiveColor,
            ),
          ),
          20.verticalSpace,
          Text(
            'BLACK IN LIGHT, RED IN DARK FROM CUSTOM EXTENSION',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: context.getTheme.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
