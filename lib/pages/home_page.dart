import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/constansts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
            ),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
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
                      Icons.search,
                      color: Constants.blackColor.withOpacity(
                        0.6,
                      ),
                    ),
                    const Expanded(
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextField(
                          textAlign: TextAlign.end,
                          showCursor: false,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                right: 5.0,
                              ),
                              hintText: 'search',
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none),
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.mic,
                      color: Constants.blackColor.withOpacity(
                        0.6,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
