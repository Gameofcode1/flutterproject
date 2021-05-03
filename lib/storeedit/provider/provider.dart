import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';

class ListCategory extends ChangeNotifier {
  List<String> _storelist = [];

  List<String> get storelist {
    return [..._storelist];
  }

  void addlist(String name) {
    _storelist.add(name);
    ChangeNotifier();
  }

  void deletelist(String name) {
    _storelist.remove(name);
    ChangeNotifier();
  }

  void clearlist(){
    _storelist.clear();
  }

  File image;

  void addimage(File catimage){
    image=catimage;
    ChangeNotifier();
  
  }




}
