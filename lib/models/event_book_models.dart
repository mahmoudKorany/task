import 'package:flutter/cupertino.dart';

class ItemModel {
  final String text;
  final String color;
  final IconData icon;

  ItemModel({required this.text, required this.icon, required this.color});
}

class ItemModel2 {
  final String image1;
  final String image2;
  final String image3;
  final String image4;
  final String title;
  final String location;

  ItemModel2({
    required this.location,
    required this.title,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
  });
}
