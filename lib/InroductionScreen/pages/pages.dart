import 'package:flutter/material.dart';

final List<Widget> images = [
  Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('images/shoe.jpg'),
        fit: BoxFit.fill,
      ),
    ),
  ),
  Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('images/shoe2.jpg'),
        fit: BoxFit.fill,
      ),
    ),
  ),
  Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('images/shoe3.jpg'),
        fit: BoxFit.fill,
      ),
    ),
  ),
];
