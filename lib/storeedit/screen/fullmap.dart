import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong/latlong.dart';

class FullMap extends StatefulWidget {
  @override
  _FullMapState createState() => _FullMapState();
}

class _FullMapState extends State<FullMap> {
  MapController maps = MapController();
  double currentzoom;

  double latitude;
  double longitude;

  Future getcurrentlocation() async {
    final geoposition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      latitude = geoposition.latitude;
      longitude = geoposition.longitude;
    });
    maps.move(LatLng(geoposition.latitude, geoposition.longitude), 17);
  }

  @override
 

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
            body: ListView(children: [
      Container(
        margin: EdgeInsets.only(left: width / 40),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            margin: EdgeInsets.only(top: height / 130, right: width / 40),
            height: height,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.black38),
                borderRadius: BorderRadius.circular(5.0),
                color: Color(0xffF3F3F3)),
            child: FlutterMap(
                children: [],
                mapController: maps,
                options: MapOptions(
                  onPositionChanged: (mapPosition, bool) {
                    setState(() {
                      latitude = maps.center.latitude;
                      longitude = maps.center.longitude;
                    });
                  },
                  center: LatLng(latitude, longitude),
                  zoom: 13.0,
                ),
                layers: [
                  new TileLayerOptions(
                      urlTemplate:
                          "https://api.mapbox.com/styles/v1/saugatt/ckojr740403wm17pc74woklrr/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoic2F1Z2F0dCIsImEiOiJja29iMW9lNjYwNGhwMm9zOWZqMmV5OGlvIn0.F_v1FzPMI4YaTvOjLX0hxA",
                      additionalOptions: {
                        'access_token':
                            "pk.eyJ1Ijoic2F1Z2F0dCIsImEiOiJja29iMW9lNjYwNGhwMm9zOWZqMmV5OGlvIn0.F_v1FzPMI4YaTvOjLX0hxA",
                        'id': "mapbox.mapbox-streets-v8"
                      }),
                  MarkerLayerOptions(markers: [
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: LatLng(latitude, longitude),
                      builder: (ctx) => new Container(
                        child: Icon(Icons.place, color: Colors.red),
                      ),
                    )
                  ]),
                ]),
          ),
        ]),
      ),
    ])));
  }
}
