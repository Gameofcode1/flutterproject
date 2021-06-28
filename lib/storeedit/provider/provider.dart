import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:myprofile/storeedit/provider/catclass.dart';
import 'package:myprofile/storeedit/provider/categoryselect.dart';

class ListCategory extends ChangeNotifier {
  List<String> _storelist = ["Clothings"];

  Map<String, String> dummydata = {
    "shopname": "Gamer Bazzar",
    "Producttitle": "Razer Mouse",
    "Productdesc":
        " HyperSpeed - Wireless Ergonomic Gaming... 2.4GHz Wireless, Black",
    "StreetAddres": "Kshetrapur2,Chitwan",
    "LocationHint": "Google the address dude"
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
    image = catimage;
    notifyListeners();
  }

  List<Catclass> cat = [
    Catclass(
      check: true,
      title: "Real Estate",
    ),
    Catclass(
      check: true,
      title: "Electronics",
    ),
  ];

  List<Catclass> newpay() {
    return cat = citems.where((element) => element.check).toList();
  }

  onstreetchange(String value) {
    dummydata["StreetAddres"] = value;
    notifyListeners();
  }

  onlocationchange(String value) {
    dummydata["LocationHint"] = value;
    notifyListeners();
  }

List<double> _latlong=[];

List<double>  get  latlon{
  return [..._latlong];
}

Future<void> getlatlon(String city)async{
  try{
  final response=await Dio().get("https://api.mapbox.com/geocoding/v5/mapbox.places/"+city+".json?access_token=pk.eyJ1Ijoic2F1Z2F0dCIsImEiOiJja29ib2l6ODAxZmxxMndtdWtiMWNyaHFwIn0.8ck81q06xvJl5ps8pLUg8w");
  final data=json.decode(response.data)['features'];
 final latlong=(data[0]['center']);
 print(city);
 print(latlong);
 _latlong=latlong;
 notifyListeners();
  }
  catch(e){
  throw(e);
  }

}







}


