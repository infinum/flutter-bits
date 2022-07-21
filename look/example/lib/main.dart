import 'package:flutter/material.dart';
import 'package:look/ui/common/look/widget/look_subtree.dart';

import 'ui/common/look/mapping/theme_data_mapping/theme_data_mapper.dart';
import 'ui/common/look/widget/look.dart';
import 'ui/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LookSubtree(
      child: Builder(
        builder: (context) {
          return MaterialApp(
            title: 'Look Demo',
            theme: ThemeDataMapper.map(Look.of(context)), // Here we map LookData theme to ThemeData
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
