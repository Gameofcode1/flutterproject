
import 'package:flutter/material.dart';

import '../models/titles.dart';

final List<Titles> catagorie = [
  Titles(
    id: 0,
    name: "Clothing",
    icons: Icons.house,
  ),
  Titles(id: 1, name: "Electronic", icons: Icons.electrical_services),
  Titles(id: 2, name: "Fashion", icons: Icons.closed_caption),
  Titles(id: 3, name: "Food", icons: Icons.ac_unit),
  Titles(
    id: 0,
    name: "Clothing",
    icons: Icons.house,
  ),
  Titles(id: 1, name: "Electronic", icons: Icons.electrical_services),
  Titles(id: 2, name: "Fashion", icons: Icons.closed_caption),
  Titles(id: 3, name: "Food", icons: Icons.ac_unit),
];

final List<String> clothing = ["Men", "Women", "Child", "Casual"];
final List<String> electronic = [
  "Laptop",
  "Mobile",
  "Fridge",
  "Washing Machine"
];
final List<String> fashion = ["Hoodie", "Glasses", "Gloves", "Scarf"];
final List<String> food = ["BreakFast", "Sweet", "Rice"];

var images = {
  "whi": "images/white.jpg",
  "katherine": "images/katherine.jpg",
  "sun": "images/fruits.jpg",
  "mon": "images/bicycle.jpg",
};
