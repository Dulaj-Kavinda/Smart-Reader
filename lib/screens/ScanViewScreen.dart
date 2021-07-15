import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:huawei_scan/HmsScanLibrary.dart';
import 'package:smart_reader/widgets/ResponseWidget.dart';

class ScanViewScreen extends StatefulWidget {


  @override
  _ScanViewScreenState createState() => _ScanViewScreenState();
}

class _ScanViewScreenState extends State<ScanViewScreen> {
  String resultScan;
  int codeFormatScan;
  int resultTypeScan;

  @override
  void initState() {
    super.initState();
    defaultView();
  }

  defaultView() async{
    try {
      DefaultViewRequest request = new DefaultViewRequest(scanType: HmsScanTypes.AllScanType);

      ScanResponse response = await HmsScanUtils.startDefaultView(request); //.timeout(const Duration(seconds: 3))

      setState(() {
        resultScan = response.originalValue;
        codeFormatScan = response.scanType;
        resultTypeScan = response.scanTypeForm;
      });

    } on PlatformException catch (err) {
      if (err.code == HmsScanErrors.scanUtilNoCameraPermission.errorCode) {
        debugPrint(HmsScanErrors.scanUtilNoCameraPermission.errorMessage);
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: resultScan == null
          ? AlertDialog(
            content: Text("Please scan a valid barcode."),
            actions: [
              RaisedButton(
                  child: Text("Back"),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          )
          : SingleChildScrollView(
              child: ResponseWidget(
              isMulti: false,
              codeFormat: codeFormatScan,
              result: resultScan,
              resultType: resultTypeScan,
            )),
    );
  }
}
