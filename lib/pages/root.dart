import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/constansts.dart';
import 'package:flutter_application_1/models/plant.dart';
import 'package:flutter_application_1/pages/card_page.dart';
import 'package:flutter_application_1/pages/favorite_page.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/profile_page.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter_application_1/pages/scan_page.dart';
import 'package:page_transition/page_transition.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int bottomIndex = 0;
  List<Plant> favorites = [];
  List<Plant> myCart = [];
  List<Widget> page() {
    return [
      const HomePage(),
      FavoritePage(
        addtofavorite: favorites,
      ),
      CardPage(
        addtocard: myCart,
      ),
      const ProfilePage(),
    ];
  }

  List<String> menueTitle = [
    'home',
    'favorite',
    'card',
    'profile',
  ];
  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.people,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(
            top: 30.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(
                color: Constants.blackColor,
                Icons.notifications,
                size: 30.0,
              ),
              Text(
                menueTitle[bottomIndex],
                style: TextStyle(
                  color: Constants.blackColor,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: bottomIndex,
        children: page(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
              child: const ScanPage(),
              type: PageTransitionType.bottomToTop,
            ),
          );
        },
        backgroundColor: Constants.primaryColor,
        child: Image.asset(
          'assets/images/code-scan-two.png',
          height: 30.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: Constants.primaryColor,
        activeColor: Constants.primaryColor,
        activeIndex: bottomIndex,
        inactiveColor: Constants.primaryColor,
        gapLocation: GapLocation.center,
        icons: iconList,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (int index) {
          setState(
            () {
              bottomIndex = index;
              final List<Plant> addF = Plant.getFavoritedPlants();
              final List<Plant> addCard = Plant.addedToCartPlants();
              favorites = addF.toSet().toList();
              myCart = addCard.toSet().toList();
            },
          );
        },
      ),
    );
  }
}
