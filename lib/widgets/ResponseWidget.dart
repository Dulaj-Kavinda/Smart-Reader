import 'package:flutter/material.dart';
import 'package:smart_reader/Utils.dart';

class ResponseWidget extends StatelessWidget {
  final int codeFormat;
  final int resultType;
  final String result;
  final bool isMulti;

  ResponseWidget({this.codeFormat, this.result, this.resultType, this.isMulti});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Color.fromRGBO(247, 242, 241, 1),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 4.0),
                    child: Text(
                      "Code Format",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ],
              ),
              Text(formatConverter(codeFormat)),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 4.0),
                    child: Text("Result Type",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                ],
              ),
              Text(resultTypeConverter(resultType)),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 4.0),
                    child: Text("Result",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                ],
              ),
              Text(result),
              isMulti != false
                  ? SizedBox(
                      height: 16.0,
                    )
                  : SizedBox(
                      height: 150.0,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
