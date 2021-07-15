import 'package:flutter/material.dart';
import 'package:huawei_ml/huawei_ml.dart';
import 'package:smart_reader/services/image_path_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_reader/screens/TextResultScreen.dart';
import 'package:smart_reader/widgets/ReusableButton.dart';
import 'package:smart_reader/constants.dart';


class TextScanScreen extends StatefulWidget {
  @override
  _TextScanScreenState createState() => _TextScanScreenState();
}

class _TextScanScreenState extends State<TextScanScreen> {
  MLTextAnalyzer analyzer;
  MLTextAnalyzerSetting setting;
  String _recognitionResult = "Result will be shown here.";

  @override
  void initState() {
    analyzer = new MLTextAnalyzer();
    setting = new MLTextAnalyzerSetting();
    checkPerms();
    _setApiKey();
    super.initState();
  }

  Future<void> checkPerms() async {
    final bool isCameraPermissionGranted =
        await MLPermissionClient().hasCameraPermission();
    if (!isCameraPermissionGranted) {
      final bool res = await MLPermissionClient()
          .requestPermission([MLPermission.camera, MLPermission.storage]);
    }
  }

  _setApiKey() async {
    await MLApplication().setApiKey(
        apiKey:
            "CgB6e3x949QIeUdotRDjH4bFi8Mktrix/6tEjg02LgBgN26w8SGXOeddfBFz3lEVRbv9krRakrzwDD7K/EMpVarn");
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
                  action_text: "USE CAMERA",
                  button_color: Colors.redAccent,
                  icon: Icons.camera_alt,
                  onPressed: () async {
                    final String path = await getImage(ImageSource.camera);
                    _startRecognition(path);
                  },
                ),
                SizedBox(
                  width: 300,
                  height: 40,
                ),
                ReusableButton(
                  action_text: "PICK FROM GALLERY",
                  button_color: Colors.orangeAccent,
                  icon: Icons.add_photo_alternate_sharp,
                  onPressed: () async {
                    final String path = await getImage(ImageSource.gallery);
                    _startRecognition(path);
                  },
                ),
              ],
            )
          ],
        ));
  }

  _startRecognition(String path) async {
    setting.path = path;
    setting.isRemote = true;
    setting.language = "en";
    setting.languageList = ["en"];
    try {
      MLText text = await analyzer.asyncAnalyzeFrame(setting);
      setState(() {
        _recognitionResult = text.stringValue;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                TextResultScreen(recognitionResult: _recognitionResult),
          ),
        );
      });
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
