import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/constansts.dart';
import 'package:flutter_application_1/models/plant.dart';
import 'package:flutter_application_1/pages/card_page.dart';

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
  // Function to toggle the selected state
  bool toggleSelected(bool isSelected) {
    return !isSelected;
  }

  @override
  Widget build(BuildContext context) {
    List<Plant> plantL = Plant.plantList;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // App bar with close and like buttons
          Positioned(
            top: 25.0,
            left: 50.0,
            right: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    // Navigate back when the close button is tapped
                    Navigator.pop(context);
                  },
                  // Close button
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
                // Like button
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
                    // Show filled or outline heart icon based on favorited state
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
            // Plant image and details section
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
                  // Plant image
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
                  // Plant feature details
                  Positioned(
                    top: 100.0,
                    right: 0.0,
                    child: SizedBox(
                      height: 200.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Display plant size
                          PlantDetils(
                            title: 'اندازه گیاه',
                            planFeature: plantL[widget.id].size,
                          ),
                          // Display humidity
                          PlantDetils(
                            title: 'رطوبت هوا ',
                            planFeature: plantL[widget.id].humidity.toString(),
                          ),
                          // Display temperature range
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
            // Positioned at the bottom of the screen
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              padding: const EdgeInsets.only(
                top: 80.0,
                left: 60.0,
                right: 60.0,
              ),
              height: size.height * 0.4, // Define the container's height
              width: size.width, // Define the container's width
              decoration: BoxDecoration(
                color: Constants.primaryColor.withOpacity(
                  0.5, // Set a semi-transparent background color
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
                  // Row for displaying star icon and rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      // Display star icon
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            size: 30.0,
                            color: Constants.primaryColor,
                          ),
                          // Display the plant's rating
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
                          // Display the plant's name
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
                          // Row for displaying price icon and price
                          Row(
                            children: <Widget>[
                              // Display price icon
                              SizedBox(
                                height: 19.0,
                                child: Image.asset(
                                  'assets/imeges/PriceUnit-green.png',
                                ),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              // Display the plant's price
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
                  // Display the plant's description
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
      floatingActionButton: SizedBox(
        width: size.width * 0.9,
        height: 50.0,
        child: Row(
          children: [
            // Shopping cart button
            Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                color: Constants.primaryColor.withOpacity(
                  0.5,
                ),
                borderRadius: BorderRadius.circular(
                  50.0,
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(
                      0.0,
                      1.1,
                    ),
                    blurRadius: 5.0,
                    color: Constants.primaryColor.withOpacity(
                      0.3,
                    ),
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CardPage(
                              addtocard: Plant.addedToCartPlants(),
                            ))),
                child: const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
              ),
            ),
            // Spacer between buttons
            SizedBox(
              width: 20.0,
              child: Expanded(
                child: Container(
                  // Button for toggling selection
                  decoration: BoxDecoration(
                    color: Constants.primaryColor,
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(
                          0.0,
                          1.1,
                        ),
                        blurRadius: 5.0,
                        color: Constants.primaryColor.withOpacity(
                          0.3,
                        ),
                      ),
                    ],
                  ),
                  child: InkResponse(
                    onTap: () {
                      setState(
                        () {
                          // Toggle the selection state of the plant
                          bool isSelected =
                              toggleSelected(plantL[widget.id].isSelected);
                          plantL[widget.id].isSelected = isSelected;
                        },
                      );
                    },
                    child: const Center(
                      child: Text(
                        'سبد خرید',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget for displaying plant details
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
        // Display the title of the plant detail
        Text(
          title,
          style: TextStyle(
            color: Constants.blackColor,
            fontSize: 10.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Display the value of the plant detail
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
