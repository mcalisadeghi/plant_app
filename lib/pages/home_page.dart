import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/constansts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              right: 20.0,
            ),
            child: InkWell(
              onTap: () {},
              child: const Text(
                'رد کردن',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          PageView(
            onPageChanged: (value) => setState(
              () {
                currentIndex = value;
              },
            ),
            controller: _pageController,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 50.0,
                  right: 50.0,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 350,
                      child: Image.asset(
                        '',
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      Constants.titleOne,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Constants.primaryColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      Constants.descriptionOne,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Constants.greyColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
