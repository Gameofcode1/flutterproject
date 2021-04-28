import 'package:flutter/material.dart';
import 'dart:io';

class Allimage extends ChangeNotifier {
  final List<Widget> images = [];
  final List<bool> check = [
    false,
    false,
    false,
  ];

  final List<String> catagories = ["Shoes", "Clothes", "Slippers"];
  final List allproduct = [["mobile", "tablet", "store"],["Shirt","paint","Tshirt"],["saugat"]];
  final List<String> addcata=["saugat"];


  void deletecat(String card) {
    addcata.remove(card);
    notifyListeners();
  }

  void deleteTask(Widget remimages) {
    images.remove(remimages);
    notifyListeners();
  }

  String addcatag(String items) {
    catagories.add(items);
    notifyListeners();
  }

  Widget add(File addimg) {
    images.add(
      Container(child: Image.file(addimg)),
    );
    notifyListeners();
  }
}
