import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/constansts.dart';
import 'package:flutter_application_1/models/plant.dart';
import 'package:flutter_application_1/pages/DetaiPage.dart';
import 'package:page_transition/page_transition.dart';

// Import necessary dependencies

class HomePage extends StatefulWidget {
  const HomePage({super.key}); // Constructor for HomePage

  @override
  State<HomePage> createState() =>
      _HomePageState(); // Create state for HomePage
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0; // Index of the selected category
  final List<String> _planTypes = [
    // List of category types
    'پیشنهادی',
    'اپارتمانی',
    'محل کار',
    'باغچه ای',
    'سمی',
  ];
  bool toggelIsF(bool isFavorites) {
    return !isFavorites;
  }

  final List<Plant> _plantList = Plant.plantList;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // Search box
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
            ),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                width: size.width * 0.9,
                decoration: BoxDecoration(
                  color: Constants.primaryColor.withOpacity(
                    0.1,
                  ),
                  borderRadius: BorderRadius.circular(
                    20.0,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.mic,
                      color: Constants.blackColor.withOpacity(
                        0.6,
                      ),
                    ),
                    const Expanded(
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextField(
                          textAlign: TextAlign.start,
                          showCursor: false,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                              right: 5.0,
                            ),
                            hintText: 'سرچ',
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.search,
                      color: Constants.blackColor.withOpacity(
                        0.6,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Category selection
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 18.0,
              vertical: 10.0,
            ),
            height: 70.0,
            width: size.width,
            child: ListView.builder(
              reverse: true,
              scrollDirection: Axis.horizontal,
              itemCount: _planTypes.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(
                    8.0,
                  ),
                  child: GestureDetector(
                    onTap: () => setState(
                      () {
                        selectedIndex = index; // Update selected index on tap
                      },
                    ),
                    child: Text(
                      _planTypes[index], // Display category text
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: selectedIndex == index
                            ? FontWeight.bold // Bold font for selected category
                            : FontWeight
                                .w300, // Normal font weight for other categories
                        color: selectedIndex == index
                            ? Constants
                                .primaryColor // Primary color for selected category
                            : Constants
                                .blackColor, // Black color for other categories
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Product One
          SizedBox(
            height: size.height * 0.3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              reverse: true,
              itemCount: _plantList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: DetaiPagee(
                          id: _plantList[index].plantId,
                        ),
                        type: PageTransitionType.leftToRightJoined,
                      ),
                    );
                  },
                  child: Container(
                    width: 200.0,
                    decoration: BoxDecoration(
                      color: Constants.primaryColor.withOpacity(
                        0.8,
                      ),
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10.0,
                          right: 20.0,
                          child: Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                50.0,
                              ),
                            ),
                            child: IconButton(
                              onPressed: () {
                                setState(
                                  () {
                                    bool isFavorites = toggelIsF(
                                      _plantList[index].isFavorated,
                                    );
                                    _plantList[index].isFavorated = isFavorites;
                                  },
                                );
                              },
                              icon: Icon(
                                _plantList[index].isFavorated == true
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                color: Constants.primaryColor,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 50.0,
                          right: 50.0,
                          top: 50.0,
                          bottom: 50.0,
                          child: Image.asset(
                            _plantList[index].imageURL,
                          ),
                        ),
                        Positioned(
                          bottom: 15,
                          left: 20,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 2.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                20.0,
                              ),
                            ),
                            child: Text(
                              r'$85' + _plantList[index].price.toString(),
                              style: TextStyle(
                                color: Constants.primaryColor,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 15,
                          right: 20.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                _plantList[index].category,
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 40.0,
                                ),
                              ),
                              Text(
                                _plantList[index].plantName,
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // new plants - text
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(
              right: 18,
              bottom: 15,
              top: 20.0,
            ),
            child: const Text(
              'new plants',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // new plants - pruduct 2
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 18.0,
            ),
            height: size.height * 0.3,
            child: ListView.builder(
              itemCount: _plantList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: DetaiPagee(
                          id: _plantList[index].plantId,
                        ),
                        type: PageTransitionType.leftToRightJoined,
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Constants.primaryColor.withOpacity(
                        0.1,
                      ),
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                    ),
                    height: 70.0,
                    width: size.width,
                    margin: const EdgeInsets.only(
                      bottom: 10.0,
                      top: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 20.0,
                              child: Image.asset(
                                'assets/imeges/PriceUnit-green.png',
                              ),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              _plantList[index].price.toString(),
                            ),
                          ],
                        ),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: 60.0,
                              height: 60.0,
                              decoration: BoxDecoration(
                                color: Constants.greyColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Positioned(
                              bottom: 5.0,
                              left: 0,
                              right: 0,
                              child: Image.asset(
                                _plantList[index].imageURL,
                              ),
                            ),
                            Positioned(
                              bottom: 5.0,
                              right: 80.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    _plantList[index].category,
                                    style: const TextStyle(
                                      fontSize: 13.0,
                                    ),
                                  ),
                                  Text(
                                    _plantList[index].plantName,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Constants.blackColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
