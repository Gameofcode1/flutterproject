import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';

import 'package:latlong/latlong.dart';
import 'package:myprofile/editpage/constant.dart';

import 'package:myprofile/storeedit/provider/provider.dart';
import 'package:myprofile/storeedit/storeedit.dart';
import 'package:provider/provider.dart';

class EditLocation extends StatefulWidget {
  double newlat;
  double newlon;
  EditLocation({this.newlat, this.newlon});
  @override
  _EditLocationState createState() => _EditLocationState();
}

// double newlatitude;
// double newlongitude;
double latitude;
double longitude;
TextEditingController lat = TextEditingController();
TextEditingController lon = TextEditingController();
TextEditingController streetname = TextEditingController();
TextEditingController locationhint = TextEditingController();

class _EditLocationState extends State<EditLocation> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      getcurrentlocation();
    });

    streetname.text = Provider.of<ListCategory>(context, listen: false)
        .dummydata['StreetAddres'];
    locationhint.text = Provider.of<ListCategory>(context, listen: false)
        .dummydata['LocationHint'];
    lat.text = latitude.toString();
    lon.text = longitude.toString();
    super.initState();
  }

  bool isloading = true;
  MapController maps = MapController();
  MapController next = MapController();
  double currentzoom = 17;

  Future getcurrentlocation() async {
    try {
      final geoposition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        latitude = geoposition.latitude;
        longitude = geoposition.longitude;
      });

      maps.move(LatLng(geoposition.latitude, geoposition.longitude), maps.zoom);
      next.move(LatLng(widget.newlat, widget.newlon), maps.zoom);
    } catch (e) {}
  }

  var mapcontroller = MapController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
            body: ListView(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          latitude == null
              ? Container()
              : Stack(
                  children: [
                    Container(
                      height: height / 2,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Color(0xffF3F3F3)),
                      child: FlutterMap(
                              children: [],
                              mapController: widget.newlat == null?maps:next,
                              options: MapOptions(                             
                                minZoom: 11.0,
                                maxZoom: 17.0,
                                interactiveFlags: InteractiveFlag.pinchZoom |
                                    InteractiveFlag.drag,
                                onPositionChanged: (mapPosition, bool) {
                                  widget.newlat == null?
                                  setState(() {
                                    latitude = maps.center.latitude;
                                    longitude = maps.center.longitude;
                                  }): setState(() {
                                    widget.newlat = next.center.latitude;
                                    widget.newlon = next.center.longitude;
                                  });
                                },
                                center:widget.newlat == null? LatLng(latitude, longitude):LatLng(widget.newlat, widget.newlon),
                                zoom: currentzoom,
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
                                    point: widget.newlat == null?LatLng(latitude, longitude): LatLng(widget.newlat, widget.newlon),
                                    builder: (ctx) => new Container(
                                      child: Icon(Icons.place,
                                          size: height / 20, color: Colors.red),
                                    ),
                                  )
                                ]),
                              ])
                        
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            size: height / 29,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Container(
                          width: width / 3,
                          child: Text("Edit Location",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: height / 45)),
                        ),
                      ],
                    ),
                  ],
                ),
          Container(
            decoration: BoxDecoration(),
            padding: EdgeInsets.only(left: width / 40, right: width / 70),
            child: Column(children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: height / 30, right: width / 50),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: Colors.black38,
                    ),
                    borderRadius: BorderRadius.circular(5.0)),
                height: height / 18,
                child: Container(
                    margin: EdgeInsets.only(left: width / 30, top: height / 70),
                    child: widget.newlat == null
                        ? Text(
                            latitude == null ? "Latitude" : latitude.toString(),
                            textAlign: TextAlign.left)
                        : Text(
                            latitude == null
                                ? "Latitude"
                                : widget.newlon.toString(),
                            textAlign: TextAlign.left)),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: height / 30, right: width / 50),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: Colors.black38,
                    ),
                    borderRadius: BorderRadius.circular(5.0)),
                height: height / 18,
                child: Container(
                    margin: EdgeInsets.only(left: width / 30, top: height / 70),
                    child: widget.newlat == null
                        ? Text(
                            latitude == null
                                ? "Longitude"
                                : longitude.toString(),
                            textAlign: TextAlign.left)
                        : Text(
                            latitude == null
                                ? "Longitude"
                                : widget.newlat.toString(),
                            textAlign: TextAlign.left)),
              ),
              Container(
                height: height / 15,
                margin: EdgeInsets.only(top: height / 30, right: width / 50),
                child: TextField(
                  onChanged: (value) {
                    
                      Provider.of<ListCategory>(context, listen: false)
                          .onstreetchange(value);
                  
                  },
                  controller: streetname,
                  obscureText: false,
                  textAlign: TextAlign.left,
                  decoration: kEditDecoration.copyWith(
                    hintText: "Street Address",
                    labelText: "Street Address",
                  ),
                ),
              ),
              Container(
                height: height / 15,
                margin: EdgeInsets.only(top: height / 30, right: width / 50),
                child: TextField(
                  onChanged: (value) {
                   
                      Provider.of<ListCategory>(context, listen: false)
                          .onlocationchange(value);
                    
                  },
                  controller: locationhint,
                  obscureText: false,
                  textAlign: TextAlign.left,
                  decoration: kEditDecoration.copyWith(
                    hintText: "Location Hint",
                    labelText: "Location Hint",
                  ),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    widget.newlat == null
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StoreEdit(
                                      lati: latitude,
                                      loti: longitude,
                                    )))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StoreEdit(
                                    lati: widget.newlat, loti: widget.newlon)));
                  },
                  child: Container(
                      width: double.infinity,
                      height: height / 20,
                      margin:
                          EdgeInsets.only(top: height / 20, right: width / 40),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Color(0xffF08626),
                      ),
                      child: Center(
                        child: Text(
                          "Change",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white, fontSize: height / 40),
                        ),
                      )),
                ),
              ),
            ]),
          )
        ],
      )
    ])));
  }
}
