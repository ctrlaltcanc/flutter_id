import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Scaffold(
      body: OrientationBuilder(
          builder: (context, orientation) {
            return orientation == Orientation.portrait
                ? _buildVerticalLayout()
                : _buildHorizontalLayout();
          },
        ),
    );
  }

  Widget _buildVerticalLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: topBanner(Orientation.portrait),
        ),
        Expanded(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              nameAndProfession(),
              myDivider(),
              centerContacts(),
              myDivider(),
              bottomLocation(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHorizontalLayout() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: topBanner(Orientation.landscape),
        ),
        Expanded(
          flex: 4,
          child: IntrinsicWidth(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                nameAndProfession(),
                myDivider(),
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      myVerticalDivider(),
                      centerContacts(),
                      myVerticalDivider(),
                      bottomLocation(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget topBanner(Orientation orientation) {
    return Container(
      child: Stack(
        overflow: Overflow.visible,
        children: [
          FractionallySizedBox(
            heightFactor: orientation == Orientation.portrait ? 0.8 : null,
            widthFactor: orientation == Orientation.landscape ? 0.8 : null,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: orientation == Orientation.portrait
                      ? Alignment.topLeft
                      : Alignment.bottomLeft,
                  end: orientation == Orientation.portrait
                      ? Alignment.bottomRight
                      : Alignment.topRight,
                  colors: [Colors.blue, Colors.blue[900]],
                  tileMode: TileMode.mirror,
                ),
              ),
            ),
          ),
          Align(
            alignment: orientation == Orientation.portrait
                ? Alignment.bottomCenter
                : Alignment.centerRight,
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
    );
  }

  Widget nameAndProfession() {
    return Column(
      children: [
        Text(
          'NAME SURNAME',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 30.0,
          ),
        ),
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

  Widget centerContacts() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconText(icon: Icons.phone, text: '+00 1234567890'),
            IconText(icon: Icons.mail, text: 'name.company@gmail.com'),
            IconText(icon: Icons.language, text: 'www.name.com'),
          ],
        ),
      ],
    );
  }

  Divider myDivider() {
    return Divider(
      height: 50.0,
      thickness: 2.0,
      indent: 30.0,
      endIndent: 30.0,
      color: Colors.blue,
    );
  }

  VerticalDivider myVerticalDivider() {
    return VerticalDivider(
      width: 50.0,
      thickness: 2.0,
      indent: 30.0,
      endIndent: 30.0,
      color: Colors.blue,
    );
  }

  Widget bottomLocation() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
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
      ],
    );
  }
}
