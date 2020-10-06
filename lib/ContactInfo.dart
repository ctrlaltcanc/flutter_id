import 'package:flutter/material.dart';

class ContactInfo {
  final String name;
  final String profession;
  final String phoneNumber;
  final String email;
  final String website;
  final String adress;
  final MaterialColor color;

  ContactInfo(
      {@required this.name,
      @required this.profession,
      @required this.phoneNumber,
      @required this.email,
      @required this.website,
      @required this.adress,
      @required this.color});
}
