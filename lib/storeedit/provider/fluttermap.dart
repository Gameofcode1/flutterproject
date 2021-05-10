import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class MapMarker with ChangeNotifier {
  List<Marker> markers = [];



  List<Marker> noneedit = [];


  addmarker(Marker marker) {
    markers.add(marker);
    notifyListeners();
  }


  addnoneditmarker(Marker marker) {
    noneedit.add(marker);
    notifyListeners();
  }

  clearaddmarker(){

    markers.clear();
    notifyListeners();
  }



  clearnonmarker(){

    noneedit.clear();
    notifyListeners();
  }


double lat;
double long;


addlatlong(double lat,double long){
  lat=lat;
  long=long;
  notifyListeners();
}

 
}
