import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/constansts.dart';
import 'package:flutter_application_1/models/plant.dart';
import 'package:flutter_application_1/widgets/plant_widget.dart';

class CardPage extends StatefulWidget {
  final List<Plant> addtocard;
  const CardPage({
    super.key,
    required this.addtocard,
  });

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.addtocard.isEmpty
          ? Center(
              // Displayed when the cart is empty
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100.0,
                    child: Image.asset(
                      'assets/images/favorited.png',
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    'سبد خرید نداری!',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 120.0,
                vertical: 30.0,
              ),
              child: Column(
                children: [
                  Expanded(
                    // List of plants added to the cart
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: widget.addtocard.length,
                      itemBuilder: (BuildContext context, int index) {
                        return NewPlantWidg(
                            plantList: widget.addtocard, index: index);
                      },
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      const Divider(
                        thickness: 1.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              SizedBox(
                                height: 20.0,
                                child: Image.asset(
                                  'assets/images/PriceUnit-green.png',
                                ),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                '44',
                                style: TextStyle(
                                  color: Constants.primaryColor,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            'جمع کل',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
