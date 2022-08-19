import 'package:flutter/material.dart';
import 'package:look/ui/common/look/look_theme_data.dart';

import 'ui/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return MaterialApp(
          title: 'Look Demo',
          theme: LookThemeData.getThemeData(),
          home: const HomeScreen(),
        );
      },
    );
  }
}
