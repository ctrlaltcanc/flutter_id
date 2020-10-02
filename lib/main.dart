import 'package:flutter/material.dart';
import 'IconText.dart';

void main() {
  runApp(MaterialApp(
    home: AboutMe(),
  ));
}

class AboutMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          topBanner(),
          centerContacts(),
          bottomLocation(),
        ],
      ),
    );
  }

  Widget topBanner() {
    return Column(
      children: [
        SizedBox(
          height: 100.0,
        ),
        Text('NAME SURNAME',
            style: TextStyle(
              color: Colors.red,
              fontSize: 30.0,
            )),
        Text(
          'PROFESSION',
          style: TextStyle(
            color: Colors.red,
            fontSize: 18.0,
          ),
        ),
      ],
    );
  }

  Padding centerContacts() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          myDivider(),
          IconText(icon: Icons.phone, text: '+00 1234567890'),
          IconText(icon: Icons.mail, text: 'name.company@gmail.com'),
          IconText(icon: Icons.language, text: 'www.name.com'),
          myDivider()
        ],
      ),
    );
  }

  Divider myDivider() {
    return Divider(
      height: 60.0,
      thickness: 2.0,
      color: Colors.red,
    );
  }

  Widget bottomLocation() {
    return Column(children: <Widget>[
      Icon(
        Icons.location_on,
        size: 50.0,
        color: Colors.red,
      ),
      Text(
        'Address, Street\nCAP: xxxxx\nCountry',
        style: TextStyle(
          color: Colors.red,
          fontSize: 15.0,
        ),
        textAlign: TextAlign.center,
      )
    ]);
  }
}
