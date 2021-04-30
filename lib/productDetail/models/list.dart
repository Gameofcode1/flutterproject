import 'package:flutter/material.dart';
import 'dart:io';

import 'package:myprofile/productadd/Listproduct/list.dart';

class Allimage extends ChangeNotifier {
  final List<Widget> images = [
    Image(image: AssetImage("images/katherine.jpg"))
    
    

  ];

  final List<bool> check = [
    false,
    false,
    false,
  ];

  final List<String> catagories = [
    "Clothing",
    "Electronics",
    "Fashions",
    "Food"
  ];
  final List allproduct = [
    ["Paint", "Shirt", "Trouser"],
    ["Mobiles", "Tablet", "Watches", "Laptops"],
    ["Sun Glasses", "Shoes", "Blazer"]
  ];
  final List<String> addcata = ["Shoe"];

  String imagesadd(imagename) {
    images.add(Container(child: Image(image: AssetImage(imagename))));
    notifyListeners();
  }

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

  String replace(start, end, replacement) {
    ;
    catagories.replaceRange(start, end, replacement);
    notifyListeners();
  }

  clearandrep(String listadd) {
    addcata.clear();
    catagories.add(listadd);
    notifyListeners();
  }

  Widget imageadd(File addimg) {
    images.add(
      Container(child: Image.file(addimg)),
    );
    notifyListeners();
  }
}
