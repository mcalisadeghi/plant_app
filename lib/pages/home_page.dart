import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/constansts.dart'; // Import necessary dependencies

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

  @override
  Widget build(BuildContext context) {
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
        ],
      ),
    );
  }
}
