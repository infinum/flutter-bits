import 'package:flutter/material.dart';

import 'ui/common/look/mapping/theme_data_mapping/theme_data_mapper.dart';
import 'ui/common/look/widget/look.dart';
import 'ui/common/look/widget/look_subtree.dart';
import 'ui/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LookSubtree(
      child: Builder(builder: (context) {
        return MaterialApp(
          title: 'Look Demo',
          theme: ThemeDataMapper.map(Look.of(context)), // Here we map LookData theme to ThemeData
          home: HomeScreen(),
        );
      }),
    );
  }
}