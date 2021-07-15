import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {

  ReusableButton({this.action_text,this.icon, this.onPressed,this.button_color});
  
  final String action_text;
  final IconData icon;
  final Function onPressed;
  final Color button_color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 80,
      child: RaisedButton(
          elevation: 0.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          padding: EdgeInsets.only(top: 7.0, bottom: 7.0, right: 40.0, left: 7.0),
          onPressed: onPressed,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                icon,
                color: Colors.black,
                size: 50.0,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    action_text,
                    style: TextStyle(
                        fontSize: 15.0, fontWeight: FontWeight.bold),
                  ))
            ],
          ),
          textColor: Color(0xFF292929),
          color: button_color),
    );
  }
}

