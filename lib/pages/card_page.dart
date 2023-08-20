import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/plant.dart';

class CardPage extends StatefulWidget {
  final List<Plant> addtocard;
  const CardPage({
    super.key,
    required this.addtocard,
  });

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'card page',
        ),
      ),
    );
  }
}
