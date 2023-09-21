import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/root.dart';

void main() {
  // This is the entry point of your app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // This is where the app starts
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Hide debug banner
      title: 'Plant App', // Title of your app
      // home: HomePage(), // Initial route is set to HomePage
      home: RootPage(), // You can switch to a different initial route if needed
    );
  }
}
