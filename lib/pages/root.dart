import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/constansts.dart';
import 'package:flutter_application_1/pages/card_page.dart';
import 'package:flutter_application_1/pages/favorite_page.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/profile_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int bottomIndex = 0;
  List<Widget> page = const [
    HomePage(),
    FavoritePage(),
    CardPage(),
    ProfilePage(),
  ];
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
            children: [
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
    );
  }
}
