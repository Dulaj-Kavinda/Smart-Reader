import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_reader/constants.dart';

class TextResultScreen extends StatelessWidget {
  final String recognitionResult;

  TextResultScreen({this.recognitionResult});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: appBarColor,
            title: Text("Smart Reader"),
          ),
          body: Column(
            children: [
              Expanded(
                flex: 10,
                child: Container(
                  margin: EdgeInsets.all(10),
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          width: .5,
                          color: Colors.black.withOpacity(.5),
                          style: BorderStyle.solid)),
                  child: Text(recognitionResult),
                ),
              ),
              Expanded(
                flex: 1,
                child: RaisedButton(
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    padding: EdgeInsets.only(
                        top: 7.0, bottom: 7.0, right: 40.0, left: 7.0),
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: recognitionResult));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.content_copy,
                            color: Colors.black,
                            size: 40.0,
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text(
                              "COPY TEXT",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15.0),
                            ))
                      ],
                    ),
                    textColor: Color(0xFF292929),
                    color: Colors.black26),
              ),
            ],
          ),
    ));
  }
}
