import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:myprofile/storeedit/provider/catclass.dart';
import 'package:myprofile/storeedit/provider/categoryselect.dart';

class ListCategory extends ChangeNotifier {
  List<String> _storelist = [];


Map<String,String> dummydata={
  "shopname":"Gamer Bazzar",
  "Producttitle":"Razer Mouse",
  "Productdesc":" HyperSpeed - Wireless Ergonomic Gaming... 2.4GHz Wireless, Black",
  "StreetAddres":"Kshetrapur2,Chitwan",
  "LocationHint":"Google the address dude"

};


  List<String> get storelist {
    return [..._storelist];
  }

  void addlist(String name) {
    _storelist.add(name);
   notifyListeners();
  }


  void deletelist(Catclass name) {
   cat.remove(name);
   notifyListeners();
  }

  void clearlist() {
    _storelist.clear();
    
  }

  File image;


  void addimage(File catimage) {
    image=catimage;
   notifyListeners();
  }

List<Catclass> cat=[];

List<Catclass> newpay(){
  return
 cat= citems.where((element) => element.check).toList();
  
}



  


}
