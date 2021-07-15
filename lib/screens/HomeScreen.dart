import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_reader/screens/TextScanScreen.dart';
import 'package:smart_reader/screens/ScannerScreen.dart';
import 'package:smart_reader/constants.dart';
import 'package:smart_reader/widgets/ReusableButton.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> moveTextScannerMode() async {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TextScanScreen(),
        ),
      );
    });
  }

  Future<void> moveQRScannerMode() async {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScannerScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appBarColor,
          title: Text("Smart Reader"),
        ),
        backgroundColor: backgroundColor,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ReusableButton(
                  action_text: "SCAN QR or BarCode",
                  button_color: Colors.blueAccent,
                  icon: Icons.api,
                  onPressed: moveQRScannerMode,
                ),

                SizedBox(
                  width: 300,
                  height: 40,
                ),

                ReusableButton(
                  action_text: "TEXT RECOGNITION",
                  button_color: Colors.blueAccent,
                  icon: Icons.art_track_rounded,
                  onPressed: moveTextScannerMode,
                ),

              ],
            )
          ],
        ));
  }
}
