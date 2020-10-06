import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_id/ContactInfo.dart';
import 'IconText.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AboutMe(),
  ));
}

class AboutMe extends StatelessWidget {
  ContactInfo contactInfo = ContactInfo(
      name: 'NAME SURNAME',
      profession: 'PROFESSION',
      phoneNumber: '+00 1234567890',
      email: 'name.company@gmail.com',
      website: 'www.name.com',
      adress: 'Address, Street\nCAP: xxxxx\nCountry',
      color: Colors.deepOrange
    );

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
                  colors: [contactInfo.color, contactInfo.color[900]],
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
                border: Border.all(width: 2.0, color: contactInfo.color),
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
          contactInfo.name,
          style: TextStyle(
            color: contactInfo.color,
            fontSize: 30.0,
          ),
        ),
        Text(
          contactInfo.profession,
          style: TextStyle(
            color: contactInfo.color,
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
            IconText(icon: Icons.phone, text: contactInfo.phoneNumber, color: contactInfo.color),
            IconText(icon: Icons.mail, text: contactInfo.email, color: contactInfo.color),
            IconText(icon: Icons.language, text: contactInfo.website, color: contactInfo.color),
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
      color: contactInfo.color,
    );
  }

  VerticalDivider myVerticalDivider() {
    return VerticalDivider(
      width: 50.0,
      thickness: 2.0,
      indent: 30.0,
      endIndent: 30.0,
      color: contactInfo.color,
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
          color: contactInfo.color,
        ),
        Text(
          contactInfo.adress,
          style: TextStyle(
            color: contactInfo.color,
            fontSize: 15.0,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
