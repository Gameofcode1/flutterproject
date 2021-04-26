import 'package:flutter/material.dart';
import 'dart:io';



class Allimage extends ChangeNotifier {

  final List<Widget> images = [

  ];

  final List<String> catagories=[
  "Shoes>",
  "Clothes>",
  "Slippers>"   
  ];

  void deletecat(String card){
    catagories.remove(card);
    notifyListeners();

  }


  void deleteTask(Widget remimages) {
    images.remove(remimages);
    notifyListeners();
  }

String addcatag(String items){
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
