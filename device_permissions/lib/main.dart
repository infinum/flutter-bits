import 'package:device_permissions/app/inject_dependencies.dart';
import 'package:device_permissions/ui/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() {

  injectDependencies();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
