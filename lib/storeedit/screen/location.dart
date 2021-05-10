import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong/latlong.dart';
import 'package:myprofile/editpage/constant.dart';
import 'package:myprofile/storeedit/provider/provider.dart';
import 'package:myprofile/storeedit/storeedit.dart';
import 'package:provider/provider.dart';

class EditLocation extends StatefulWidget {
  @override
  _EditLocationState createState() => _EditLocationState();
}

double latitude;
double longitude;
TextEditingController lat = TextEditingController();
TextEditingController lon = TextEditingController();
TextEditingController streetname = TextEditingController();
TextEditingController locationhint = TextEditingController();

class _EditLocationState extends State<EditLocation> {
  @override
  void initState() {
    getcurrentlocation();
    streetname.text = Provider.of<ListCategory>(context, listen: false)
        .dummydata['StreetAddres'];
    locationhint.text = Provider.of<ListCategory>(context, listen: false)
        .dummydata['LocationHint'];
    super.initState();
  }

  List<Marker> markers = [];
  double currentzoom;
  Future getcurrentlocation() async {
    final geoposition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      latitude = geoposition.latitude;
      longitude = geoposition.longitude;
      markers = [
        new Marker(
          width: 80.0,
          height: 80.0,
          point: LatLng(latitude, longitude),
          builder: (ctx) => new Container(
            child: Icon(Icons.place, color: Colors.red),
          ),
        ),
      ];
    });
    if (latitude != null) {
      currentzoom = currentzoom - 1;
      mapcontroller.move(LatLng(latitude, longitude), currentzoom);
    }
  }

  var mapcontroller = MapController();

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
                        fontWeight: FontWeight.w900, fontSize: height / 45)),
              ),
            ],
          ),
          latitude == null
              ? Container()
              : Container(
                  margin: EdgeInsets.only(top: height / 30, right: width / 40),
                  height: height / 9,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.0, color: Colors.black38),
                      borderRadius: BorderRadius.circular(5.0),
                      color: Color(0xffF3F3F3)),
                  child: FlutterMap(
                      children: [],
                      options: MapOptions(
                        onTap: (LatLng point) {
                          print('tapped');
                          setState(() {
                            markers.clear();
                            latitude=point.latitude;
                            longitude=point.longitude;
                            markers.add(Marker(
                              width: 80.0,
                            
                              height: 80.0,
                              point: point,
                              builder: (ctx) => new Container(
                                child: Icon(Icons.place, color: Colors.green),
                              ),
                            ));
                          });
                        },
                        center: LatLng(latitude, longitude),
                        zoom: 13.0,
                      ),
                      layers: [
                        new TileLayerOptions(
                            urlTemplate:
                                "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                            subdomains: ['a', 'b', 'c']),
                        MarkerLayerOptions(
                          markers: markers,
                        ),
                      ]),
                ),
          Container(
            height: height / 15,
            margin: EdgeInsets.only(top: height / 30, right: width / 50),
            child: TextField(
              readOnly: true,
              obscureText: false,
              textAlign: TextAlign.left,
              decoration: kEditDecoration.copyWith(
                hintText: latitude.toString(),
                labelText: " latitude",
              ),
            ),
          ),
          Container(
            height: height / 15,
            margin: EdgeInsets.only(top: height / 30, right: width / 50),
            child: TextField(
              obscureText: false,
              readOnly: true,
              textAlign: TextAlign.left,
              decoration: kEditDecoration.copyWith(
                hintText: longitude.toString(),
                labelText: " longitude",
              ),
            ),
          ),
          Container(
            height: height / 15,
            margin: EdgeInsets.only(top: height / 30, right: width / 50),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  Provider.of<ListCategory>(context, listen: false)
                      .onstreetchange(value);
                });
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
                setState(() {
                  Provider.of<ListCategory>(context, listen: false)
                      .onlocationchange(value);
                });
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StoreEdit()));
              },
              child: Container(
                  width: double.infinity,
                  height: height / 20,
                  margin: EdgeInsets.only(top: height / 20, right: width / 40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Color(0xffF08626),
                  ),
                  child: Center(
                    child: Text(
                      "Change",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(color: Colors.white, fontSize: height / 40),
                    ),
                  )),
            ),
          ),
        ]),
      ),
    ])));
  }
}
