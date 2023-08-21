// Import necessary dependencies
import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/constansts.dart';
import 'package:flutter_application_1/widgets/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(
          20.0,
        ),
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            // User Profile Avatar and Name
            Container(
              width: 150.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Constants.primaryColor,
                  width: 5.0,
                ),
              ),
              child: const CircleAvatar(
                radius: 60.0,
                backgroundColor: Colors.transparent,
                backgroundImage: ExactAssetImage(
                  'assets/images/profile.jpg',
                ),
              ),
            ),
            // User Name with Verification Badge
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'tara',
                  style: TextStyle(
                    color: Constants.blackColor,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                SizedBox(
                  height: 20.0,
                  child: Image.asset(
                    'assets/images/verified.png',
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            // User Email
            Text(
              'tara@gmail.com',
              style: TextStyle(
                color: Constants.blackColor.withOpacity(
                  0.4,
                ),
                fontSize: 16.0,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            // List of User Setting Options
            const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SettingOption(
                  icon: Icons.percent,
                  title: 'پروفایل من ',
                ),
                SettingOption(
                  icon: Icons.percent,
                  title: 'پروفایل من ',
                ),
                SettingOption(
                  icon: Icons.percent,
                  title: 'پروفایل من ',
                ),
                SettingOption(
                  icon: Icons.percent,
                  title: 'پروفایل من ',
                ),
                SettingOption(
                  icon: Icons.percent,
                  title: 'پروفایل من ',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
