import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong/latlong.dart';
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

  Future getcurrentlocation() async {
    final geoposition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      latitude = geoposition.latitude;
      longitude = geoposition.longitude;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
            body: ListView(children: [
      Container(
        margin: EdgeInsets.only(top: height / 70, left: width / 40),
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
          Center(
            child: Container(
                margin: EdgeInsets.only(
                    bottom: height / 60, right: width / 9, top: height / 60),
                child: Image(
                  image: AssetImage("images/locations.png"),
                  height: height / 7,
                )),
          ),
          latitude == null
              ? Container()
              : Container(
                  margin: EdgeInsets.only(top: height / 200, right: width / 40),
                  height: height / 9,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.0, color: Colors.black38),
                      borderRadius: BorderRadius.circular(5.0),
                      color: Color(0xffF3F3F3)),
                  child: FlutterMap(
                      options: MapOptions(
                        center: LatLng(latitude, longitude),
                        zoom: 13.0,
                      ),
                      layers: [
                        new TileLayerOptions(
                            urlTemplate:
                                "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                            subdomains: ['a', 'b', 'c']),
                        MarkerLayerOptions(
                          markers: [
                            new Marker(
                              width: 80.0,
                              height: 80.0,
                              point: LatLng(latitude, longitude),
                              builder: (ctx) => new Container(
                                child: Icon(Icons.place, color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
          Container(
            height: height / 16,
            margin: EdgeInsets.only(right: width / 40, top: height / 40),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(width: 1.0, color: Colors.black38)),
            padding: EdgeInsets.only(top: height / 200, left: width / 40),
            child: FormBuilderTextField(
              name: "Textfield",
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: latitude.toString(),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none),
            ),
          ),
          Container(
            height: height / 16,
            margin: EdgeInsets.only(right: width / 40, top: height / 40),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(width: 1.0, color: Colors.black38)),
            padding: EdgeInsets.only(top: height / 200, left: width / 40),
            child: FormBuilderTextField(
              keyboardType: TextInputType.number,
              name: "Textfield",
              decoration: InputDecoration(
                  hintText: longitude.toString(),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none),
            ),
          ),
          Container(
            height: height / 16,
            margin: EdgeInsets.only(right: width / 40, top: height / 40),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(width: 1.0, color: Colors.black38)),
            padding: EdgeInsets.only(top: height / 200, left: width / 40),
            child: FormBuilderTextField(
              name: "Textfield",
              controller: streetname,
              decoration: InputDecoration(
                  hintText: "Street Address",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none),
            ),
          ),
          Container(
            height: height / 16,
            margin: EdgeInsets.only(right: width / 40, top: height / 40),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(width: 1.0, color: Colors.black38)),
            padding: EdgeInsets.only(top: height / 200, left: width / 40),
            child: FormBuilderTextField(
              name: "Textfield",
              controller: locationhint,
              decoration: InputDecoration(
                  hintText: "Location Hint",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none),
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: (){Navigator.push(context,
                        MaterialPageRoute(builder: (context) => StoreEdit()));},
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
