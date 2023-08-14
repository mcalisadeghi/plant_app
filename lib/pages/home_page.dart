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
  Widget _indicator(bool slideActive) {
    return AnimatedContainer(
      duration: const Duration(
        microseconds: 500,
      ),
      height: slideActive ? 20.0 : 10.0,
      margin: const EdgeInsets.only(
        right: 5.0,
      ),
      decoration: BoxDecoration(
        color: Constants.primaryColor,
        borderRadius: BorderRadius.circular(
          5.0,
        ),
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicator = [];
    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicator.add(
          _indicator(
            true,
          ),
        );
      } else {
        indicator.add(
          _indicator(
            false,
          ),
        );
      }
    }
    return indicator;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: const [
          CreatePicWidget(),
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
              CreateContetnPage(
                description: Constants.descriptionOne,
                image: 'assets/image/pic1.jpg',
                title: Constants.titleOne,
              ),
            ],
          ),
          Positioned(
              bottom: 80.0,
              left: 30.0,
              child: Row(
                children: _buildIndicator(),
              ))
        ],
      ),
    );
  }
}

class CreateContetnPage extends StatelessWidget {
  final String image;
  final title;
  final description;
  const CreateContetnPage({
    required this.image,
    required this.title,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 50.0,
        right: 50.0,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 350,
            child: Image.asset(
              image,
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25.0,
              color: Constants.primaryColor,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25.0,
              color: Constants.greyColor,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }
}

class CreatePicWidget extends StatelessWidget {
  const CreatePicWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
