import 'package:flutter/material.dart';
import 'dart:io';

class Allimage extends ChangeNotifier {
  final List<Widget> images = [
    Image(image: AssetImage("images/katherine.jpg"))
  ];

  String producttitle="Men's Wool Runers-natural Grey";
  String regularprice="7000";
  String offerprice="5000";
  String description="A shoe is an item of footwear intended to protect and comfort the human foot. Shoes are also used as an item of decoration and fashion. ... Additionally, fashion has often dictated many design elements, such as whether shoes have very high heels or flat ones.";

  final List<bool> check = [
    false,
    false,
    false,
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

  Widget imageadd(File addimg) {
    images.add(
      Container(child: Image.file(addimg)),
    );
    notifyListeners();
  }

  
 onitemchange({string,value}){
  value=string;
notifyListeners();

}

}
