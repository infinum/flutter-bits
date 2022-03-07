import 'package:flutter/material.dart';
import 'package:look/ui/common/look/look_data/look_data.dart';
import 'package:look/ui/common/look/widget/look_builder.dart';

import 'ui/common/look/mapping/theme_data_mapping/theme_data_mapper.dart';
import 'ui/common/look/widget/look.dart';
import 'ui/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LookBuilder(
      lookData: LookData.getDefault(),
      builder: (context) {
        return MaterialApp(
          title: 'Look Demo',
          theme: ThemeDataMapper.map(Look.of(context)), // Here we map LookData theme to ThemeData
          home: HomeScreen(),
        );
      },
    );
  }
}
