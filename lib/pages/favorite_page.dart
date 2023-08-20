import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/plant.dart';
import 'package:flutter_application_1/widgets/plant_widget.dart';

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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: widget.addtofavorite.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100.0,
                    child: Image.asset(
                      'assets/images/favorited.png',
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    'علاقه مندی نداری!',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 120.0,
                vertical: 30.0,
              ),
              height: size.height * 0.5,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: widget.addtofavorite.length,
                  itemBuilder: (context, index) {
                    return NewPlantWidg(
                        plantList: widget.addtofavorite, index: index);
                  }),
            ),
    );
  }
}
