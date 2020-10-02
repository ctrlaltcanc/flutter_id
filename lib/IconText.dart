import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final String text;

  IconText({this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20.0, 5.0, 10.0, 5.0),
          child: Container(
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.red),
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Icon(
                icon,
                size: 30.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.red,
            fontSize: 20.0,
            letterSpacing: 1.0,
          ),
        ),
      ],
    );
  }
}
