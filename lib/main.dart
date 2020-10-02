import 'package:flutter/material.dart';
import 'IconText.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
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
        Container(
          height: 180.0,
          child: Stack(
            overflow: Overflow.visible,
            children: [
              Container(
                height: 140.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.blue, Colors.blue[900]],
                    tileMode: TileMode.mirror,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2.0, color: Colors.blue),
                  ),
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage('assets/user-picture.png'),
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Text('NAME SURNAME',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 30.0,
            )),
        Text(
          'PROFESSION',
          style: TextStyle(
            color: Colors.blue,
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
      color: Colors.blue,
    );
  }

  Widget bottomLocation() {
    return Column(children: <Widget>[
      Icon(
        Icons.location_on,
        size: 50.0,
        color: Colors.blue,
      ),
      Text(
        'Address, Street\nCAP: xxxxx\nCountry',
        style: TextStyle(
          color: Colors.blue,
          fontSize: 15.0,
        ),
        textAlign: TextAlign.center,
      )
    ]);
  }
}
