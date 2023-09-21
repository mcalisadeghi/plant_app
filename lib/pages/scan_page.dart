import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/constansts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late QRScanView controller;
  bool isCameraPermissionGranted = false;
  Future<void> _qrsnaner() async {
    var cameraStatus = await Permission.camera.status;
    if (!cameraStatus.isGranted) {
      var permissionStatus = await Permission.camera.request();
      if (permissionStatus.isGranted) {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => QRScanView(),
        //   ),
        // );
      }
    } else {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => QRScanView(),
      //   ),
      // );
    }
  }

  @override
  void initState() {
    super.initState();
    _qrsnaner();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // App bar
          Positioned(
            top: 25.0,
            left: 50.0,
            right: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  // close button
                  child: Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        50.0,
                      ),
                      color: Constants.primaryColor.withOpacity(
                        0.15,
                      ),
                    ),
                    child: Icon(
                      Icons.close,
                      color: Constants.primaryColor,
                    ),
                  ),
                ),
                // share button
                Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      50.0,
                    ),
                    color: Constants.primaryColor.withOpacity(
                      0.15,
                    ),
                  ),
                  child: Icon(
                    Icons.share,
                    color: Constants.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 100.0,
            left: 20.0,
            right: 20.0,
            child: SizedBox(
              width: size.width * 0.8,
              height: size.height * 0.8,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _qrsnaner(); // اجازه دسترسی به دوربین چک می‌شود
                        if (isCameraPermissionGranted) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const QRScanView(), // به صفحه‌ی اسکن کردن منتقل می‌شویم
                            ),
                          );
                        }
                      },
                      child: Image.asset(
                        'assets/images/code-scan.png',
                        height: 100.0,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'scan',
                      style: TextStyle(
                        color: Constants.primaryColor.withOpacity(
                          0.8,
                        ),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class QRScanView extends StatelessWidget {
  const QRScanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'اسکنر QR',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            QrImageView(
              data: 'https://www.example.com', // با داده‌ی واقعی جایگزین کنید
              version: QrVersions.auto,
              size: 200.0,
            ),
            const SizedBox(height: 20.0),
            const Text(
              'کد QR را اسکن کنید',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
