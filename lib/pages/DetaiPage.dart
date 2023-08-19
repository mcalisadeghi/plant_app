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
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 50.0,
            left: 25.0,
            right: 30.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
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
        ],
      ),
    );
  }
}
