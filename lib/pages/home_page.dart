// Import necessary dependencies
import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/constansts.dart';
import 'package:flutter_application_1/models/plant.dart';
import 'package:flutter_application_1/pages/detai_page.dart';
import 'package:flutter_application_1/widgets/plant_widget.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final List<Plant> _plantList = Plant.plantList;

  bool toggleIsFavorit(bool isFavorites) {
    return !isFavorites;
  }

  final List<String> _plantTypes = [
    '| پیشنهادی |',
    '| آپارتمانی |',
    '| محل‌کار |',
    '| گل باغچه‌ایی |',
    '| گل سمی |',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Search Box
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor.withOpacity(
                      0.1,
                    ), // Background color of the search box
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.mic,
                        color: Constants.blackColor.withOpacity(
                          0.6,
                        ), // Color of the microphone icon
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
                              hintText: 'جستجو...',
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
                        ), // Color of the search icon
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Category
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
                itemCount: _plantTypes.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(
                      8.0,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            selectedIndex = index;
                          },
                        );
                      },
                      child: Text(
                        _plantTypes[index], // Display the plant type text
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: selectedIndex == index
                              ? FontWeight.bold
                              : FontWeight.w300,
                          color: selectedIndex == index
                              ? Constants
                                  .primaryColor // Highlighted text color if selected
                              : Constants.blackColor, // Default text color
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
                itemCount: _plantList.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                reverse: true,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: DetaiPagee(
                            id: _plantList[index].plantId,
                          ),
                          type: PageTransitionType.topToBottom,
                        ),
                      );
                    },
                    child: Container(
                      width: 200.0,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 18.0,
                      ),
                      decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(
                          0.8,
                        ),
                        borderRadius: BorderRadius.circular(
                          20.0,
                        ),
                      ),
                      child: Stack(
                        children: <Widget>[
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
                                      bool isFavorited = toggleIsFavorit(
                                          (_plantList[index].isFavorated));
                                      _plantList[index].isFavorated =
                                          isFavorited;
                                    },
                                  );
                                },
                                icon: Icon(
                                  _plantList[index].isFavorated == true
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  color: Constants.primaryColor,
                                  size: 20.0,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 50.0,
                            right: 50.0,
                            top: 50.0,
                            bottom: 50.0,
                            child: Image.asset(_plantList[index].imageURL),
                          ),
                          Positioned(
                            bottom: 15.0,
                            left: 20.0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 2.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  20.0,
                                ),
                              ),
                              child: Text(
                                r'$' + _plantList[index].price.toString(),
                                style: TextStyle(
                                  color: Constants.primaryColor,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 15.0,
                            right: 20.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  _plantList[index].category,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14.0,
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
            // New Plants - Text
            Container(
              alignment: Alignment.centerRight,
              padding:
                  const EdgeInsets.only(right: 18.0, bottom: 15.0, top: 20.0),
              child: const Text(
                'گیاهان جدید',
                style: TextStyle(
                  fontFamily: 'Lalezar',
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // New Plants - Product 2
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              height: size.height * 0.3,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _plantList.length,
                itemBuilder: (BuildContext context, int index) {
                  return NewPlantWidg(
                    plantList: _plantList,
                    index: index,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
