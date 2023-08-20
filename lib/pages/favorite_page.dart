import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/plant.dart';

class FavoritePage extends StatefulWidget {
  final List<Plant> addtofavorite;
  const FavoritePage({
    super.key,
    required this.addtofavorite,
  });

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'favorite page',
        ),
      ),
    );
  }
}
