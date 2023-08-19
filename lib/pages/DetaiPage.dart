import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/constansts.dart';
import 'package:flutter_application_1/models/plant.dart';

class DetaiPagee extends StatefulWidget {
  final int id;
  const DetaiPagee({
    super.key,
    required this.id,
  });

  @override
  State<DetaiPagee> createState() => _DetaiPageeState();
}

class _DetaiPageeState extends State<DetaiPagee> {
  @override
  Widget build(BuildContext context) {
    List<Plant> plantL = Plant.plantList;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // App bar
          Positioned(
            top: 25.0,
            left: 50.0,
            right: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  // close button
                  child: Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        50.0,
                      ),
                      color: Constants.primaryColor.withOpacity(
                        0.15,
                      ),
                    ),
                    child: Icon(
                      Icons.close,
                      color: Constants.primaryColor,
                    ),
                  ),
                ),
                // like button
                Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      50.0,
                    ),
                    color: Constants.primaryColor.withOpacity(
                      0.15,
                    ),
                  ),
                  child: Icon(
                    plantL[widget.id].isFavorated == true
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Constants.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            child: Container(
              width: size.width * 0.8,
              height: size.height * 0.8,
              padding: const EdgeInsets.all(
                20.0,
              ),
              child: Stack(
                children: [
                  // for plant pic for priduct img
                  Positioned(
                    top: 70.0,
                    left: 50.0,
                    child: SizedBox(
                      height: 350.0,
                      child: Image.asset(
                        plantL[widget.id].imageURL,
                      ),
                    ),
                  ),
                  // for get plant detels
                  // plant Feature
                  Positioned(
                    top: 100.0,
                    right: 0.0,
                    child: SizedBox(
                      height: 200.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PlantDetils(
                            title: 'اندازه گیاه',
                            planFeature: plantL[widget.id].size,
                          ),
                          PlantDetils(
                            title: 'رطوبت هوا ',
                            planFeature: plantL[widget.id].humidity.toString(),
                          ),
                          PlantDetils(
                            title: 'دمای نگه داری',
                            planFeature:
                                plantL[widget.id].temperature.toString(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// inishial date get for plant deatels
class PlantDetils extends StatelessWidget {
  final String title;
  final String planFeature;
  const PlantDetils({
    required this.title,
    required this.planFeature,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Constants.blackColor,
            fontSize: 10.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          planFeature,
          style: TextStyle(
            color: Constants.blackColor,
            fontSize: 10.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
