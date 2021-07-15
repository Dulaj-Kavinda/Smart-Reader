import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huawei_scan/HmsScanLibrary.dart';
import 'package:smart_reader/screens/ScanViewScreen.dart';
import 'package:flutter/services.dart' show DeviceOrientation, SystemChrome;

import '../constants.dart';


class ScannerScreen extends StatefulWidget {
  @override
  _ScannerScreenState createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  String permissionState = "Permissions Are Not Granted.";
  bool hmsLoggerStatus = true;

  @override
  void initState() {
    permissionRequest();
    super.initState();
  }

  permissionRequest() async {
    bool permissionResult = await HmsScanPermissions.hasCameraAndStoragePermission();
    if (permissionResult == false) {
      await HmsScanPermissions.requestCameraAndStoragePermissions();
    } else {
      setState(() {
        permissionState = "All Permissions Are Granted";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text("Smart Reader"),
      ),
      body: ScanViewScreen(),

    );
  }


}