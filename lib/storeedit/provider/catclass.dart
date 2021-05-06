import 'package:flutter/material.dart';


class Catclass with ChangeNotifier {

  final IconData icon;
  final String title;
  bool check;

  Catclass({this.icon, this.title,this.check=false});

  onclick(){
    check=!check;
    notifyListeners();


  
}}