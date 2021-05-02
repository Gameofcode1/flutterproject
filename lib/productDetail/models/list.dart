import 'package:flutter/material.dart';
import 'dart:io';



class Allimage extends ChangeNotifier {
  final List<Widget> images = [
    Image(image: AssetImage("images/katherine.jpg"))
  ];

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
}
