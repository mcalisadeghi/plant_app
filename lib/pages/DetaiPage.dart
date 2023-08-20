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
            right: 50.0,
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
            top: 43.0,
            left: 20.0,
            right: 20.0,
            child: Container(
              width: size.width * 0.8,
              height: size.height * 0.8,
              padding: const EdgeInsets.all(
                20.0,
              ),
              child: Stack(
                children: <Widget>[
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
                        children: <Widget>[
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
          Positioned(
            // top: 400.0,
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              padding: const EdgeInsets.only(
                top: 80.0,
                left: 60.0,
                right: 60.0,
              ),
              height: size.height * 0.4,
              width: size.width,
              decoration: BoxDecoration(
                color: Constants.primaryColor.withOpacity(
                  0.5,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(
                    30.0,
                  ),
                  topRight: Radius.circular(
                    30.0,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            size: 30.0,
                            color: Constants.primaryColor,
                          ),
                          Text(
                            plantL[widget.id].rating.toString(),
                            style: TextStyle(
                              fontSize: 23.0,
                              color: Constants.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            plantL[widget.id].plantName.toString(),
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Constants.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              SizedBox(
                                height: 19.0,
                                child: Image.asset(
                                  'assets/imeges/PriceUnit-green.png',
                                ),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                plantL[widget.id].price.toString(),
                                style: TextStyle(
                                  fontSize: 24.0,
                                  color: Constants.blackColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    plantL[widget.id].decription.toString(),
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      height: 1.6,
                      fontSize: 18.0,
                      color: Constants.blackColor.withOpacity(
                        0.7,
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
      children: <Widget>[
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
