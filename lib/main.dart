import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/root.dart';
import 'package:flutter_application_1/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plant App',
      // home: HomePage(),
      home: RootPage(),
    );
  }
}
