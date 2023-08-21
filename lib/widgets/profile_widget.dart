import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/constansts.dart';

class SettingOption extends StatelessWidget {
  final IconData icon;
  final String title;

  const SettingOption({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 18.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back arrow icon
          Icon(
            Icons.arrow_back_ios,
            size: 16.0,
            color: Constants.blackColor.withOpacity(
              0.4,
            ),
          ),
          // Setting title and additional icon
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Constants.blackColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Icon(
                Icons.abc, // Replace with the desired icon
                color: Constants.blackColor.withOpacity(
                  0.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
