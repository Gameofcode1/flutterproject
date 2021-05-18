import 'dart:io';
import 'package:flutter/scheduler.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:myprofile/editpage/constant.dart';
import 'package:myprofile/profile/profile.dart';
import 'package:geolocator/geolocator.dart';
import 'package:myprofile/storeedit/provider/datetime.dart';
import 'package:myprofile/storeedit/provider/paymentlist.dart';
import 'package:myprofile/storeedit/screen/location.dart';
import './screen/location.dart';
import 'screen/paymentedit.dart';
import 'package:myprofile/productadd/Listproduct/list.dart';
import 'package:myprofile/productadd/models/titles.dart';
import 'package:myprofile/productadd/widget/checkboxand%20text.dart';
import 'package:provider/provider.dart';
import 'Category/category.dart';
import 'provider/provider.dart';
import './seleceimages/selectimages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'constannt.dart';

class StoreEdit extends StatefulWidget {
  final double lati;
  final double loti;
  StoreEdit({this.lati, this.loti});

  @override
  _StoreEditState createState() => _StoreEditState();
}

class _StoreEditState extends State<StoreEdit> {
  TextEditingController optime = TextEditingController();
  TextEditingController cltime = TextEditingController();
  bool saugat = false;
  File _image;

  Future getImagefromcamera() async {
    var image = await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      _image = File(image.path);
    });
    Navigator.pop(context);
    Provider.of<ListCategory>(context, listen: false).addimage(_image);
  }

  Future getImagefromGallery() async {
    var image = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image.path);
    });
    Navigator.pop(context);
    Provider.of<ListCategory>(context, listen: false).addimage(_image);
  }

  String firstcat;
  String secondcat;
  var concatenate = StringBuffer();
  void items() {
    setState(() {
      Provider.of<ListCategory>(context, listen: false).cat.forEach((element) {
        concatenate.write(element.title + ",");
      });
      secondcat = concatenate.toString();
    });
  }

  var maincategory = StringBuffer();
  void maincategories() {
    Provider.of<ListCategory>(context, listen: false)
        .storelist
        .forEach((element) {
      maincategory.write(element);
    });
    firstcat = maincategory.toString();
  }

  String sumchar;
  void addchar() {
    if (firstcat.length > 0)
      sumchar = firstcat + ">" + secondcat;
    else
      sumchar = "";
  }

  bool checkbox = false;
  bool storestatus = false;
  bool iconclick = false;
  double latitude;
  double longitude;
  bool categorycheck = false;

  List<Titles> newdata = List.from(catagorie);

  onitemchanged(String value) {
    setState(() {
      newdata = catagorie
          .where((string) =>
              string.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  String streetname;
  String locationhint;
  TimeOfDay openingtime;
  TimeOfDay closingtime;

  bool check = true;

  @override
  void initState() {
    if (check = true) {
      Future.delayed(Duration.zero, () async {
        getcurrentlocation();
      });
      check = false;
    }

    super.initState();
    Provider.of<DateAndTimeSlect>(context, listen: false).gettime();

    items();

    maincategories();
    addchar();
    shopname.text =
        Provider.of<ListCategory>(context, listen: false).dummydata['shopname'];

    producttitle.text = Provider.of<ListCategory>(context, listen: false)
        .dummydata['Producttitle'];
    description.text = Provider.of<ListCategory>(context, listen: false)
        .dummydata['Productdesc'];
    streetname = Provider.of<ListCategory>(context, listen: false)
        .dummydata['StreetAddres'];
    locationhint = Provider.of<ListCategory>(context, listen: false)
        .dummydata['LocationHint'];
    categorye.text = sumchar.toString();
    super.initState();
  }

  MapController mapController = MapController();

  List<Marker> markers = [];
  Future getcurrentlocation() async {
    setState(() {
      isloading = false;
    });
    final geoposition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      latitude = geoposition.latitude;
      longitude = geoposition.longitude;
    });
    setState(() {
      isloading = true;
    });
  }

  TextEditingController shopname = TextEditingController();
  TextEditingController producttitle = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController lat = TextEditingController();
  TextEditingController lon = TextEditingController();

  TextEditingController categorye = TextEditingController();
  TextEditingController maincat = TextEditingController();

  bool isloading = true;

  @override
  void dispose() {
    getcurrentlocation();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    var width = MediaQuery.of(context).size.width;
    var selecttime = Provider.of<DateAndTimeSlect>(context);
    final storeprovider = Provider.of<ListCategory>(context);
    final payment = Provider.of<Paymentlist>(context, listen: true);

    return ChangeNotifierProvider(
      create: (context) => ListCategory(),
      child: Scaffold(
          body: SafeArea(
              child: Container(
                  margin: EdgeInsets.only(left: width / 80),
                  child: ListView(
                    children: [
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
                            margin: EdgeInsets.only(left: width / 40),
                            child: Text(
                              "Edit Your Store",
                              style: TextStyle(
                                  fontSize: height / 43,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: height / 105),
                        child: Center(
                          child: Container(
                            child: Stack(overflow: Overflow.visible, children: [
                              Container(
                                child: storeprovider.image == null
                                    ? GestureDetector(
                                        onTap: () {
                                          showModalBottomSheet(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(20.0),
                                                  topRight:
                                                      Radius.circular(20.0),
                                                ),
                                              ),
                                              context: context,
                                              builder: (context) =>
                                                  SelectImages(
                                                    getImagefromGallery:
                                                        getImagefromGallery,
                                                    getImagefromcamera:
                                                        getImagefromcamera,
                                                  ));
                                        },
                                        child: CircleAvatar(
                                          backgroundColor: Colors.black26,
                                          radius: height / 13.6,
                                          child: CircleAvatar(
                                            backgroundColor: Color(0xffDADADA),
                                            radius: height / 14,
                                            child: Icon(
                                                Icons.add_photo_alternate,
                                                color: Colors.black,
                                                size: height / 26),
                                          ),
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          showModalBottomSheet(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(20.0),
                                                  topRight:
                                                      Radius.circular(20.0),
                                                ),
                                              ),
                                              context: context,
                                              builder: (context) =>
                                                  SelectImages(
                                                    getImagefromGallery:
                                                        getImagefromGallery,
                                                    getImagefromcamera:
                                                        getImagefromcamera,
                                                  ));
                                        },
                                        child: CircleAvatar(
                                          radius: height / 14,
                                          backgroundImage: FileImage(
                                              Provider.of<ListCategory>(context)
                                                  .image),
                                        ),
                                      ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(top: height / 50, left: width / 30),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Add Store Description",
                                  style:
                                      kHeading.copyWith(fontSize: height / 50)),
                              storeprovider.cat.length == 0
                                  ? SizedBox.shrink()
                                  : Row(children: [
                                      Expanded(
                                          child: Container(
                                        margin: EdgeInsets.only(
                                            right: width / 30,
                                            left: width / 30),
                                        height: height / 18,
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            itemCount: storeprovider.cat.length,
                                            itemBuilder: (context, index) {
                                              return Stack(
                                                children: [
                                                  Card(
                                                    margin: EdgeInsets.only(
                                                        top: height / 60,
                                                        right: width / 90),
                                                    elevation: 1,
                                                    child: Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical:
                                                                    height /
                                                                        400,
                                                                horizontal:
                                                                    width / 20),
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      height /
                                                                          100,
                                                                  horizontal:
                                                                      width /
                                                                          70),
                                                          child: Text(
                                                            storeprovider
                                                                .cat[index]
                                                                .title,
                                                            style: TextStyle(
                                                                fontSize:
                                                                    height /
                                                                        80),
                                                          ),
                                                        )),
                                                  ),
                                                  Positioned(
                                                    bottom: height / 40,
                                                    left: width / 300,
                                                    child: InkWell(
                                                      highlightColor:
                                                          Colors.black,
                                                      onTap: () {
                                                        setState(() {
                                                          storeprovider
                                                              .deletelist(
                                                                  storeprovider
                                                                          .cat[
                                                                      index]);
                                                        });
                                                      },
                                                      child: CircleAvatar(
                                                        backgroundColor:
                                                            Colors.orange,
                                                        radius: height / 90,
                                                        child: Icon(
                                                          Icons.clear,
                                                          size: height / 70,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            }),
                                      ))
                                    ]),
                              FormBuilder(
                                // key: _formkey,
                                child: Column(
                                  children: [
                                    Container(
                                      height: height / 16,
                                      margin: EdgeInsets.only(
                                          right: width / 40, top: height / 70),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(
                                            width: 1.0,
                                            color: Colors.black38,
                                          )),
                                      padding: EdgeInsets.only(
                                          top: height / 200, left: width / 40),
                                      child: FormBuilderTextField(
                                        onTap: () {
                                          setState(() {
                                            categorycheck = !categorycheck;
                                          });
                                        },
                                        name: "Textfield",
                                        onChanged: onitemchanged,
                                        decoration: InputDecoration(
                                            suffixIcon: GestureDetector(
                                                child: Icon(
                                              Icons.expand_more,
                                              color: Colors.black,
                                            )),
                                            hintText: "Select Category",
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none),
                                      ),
                                    ),
                                    categorycheck
                                        ? Row(children: [
                                            Expanded(
                                                child: Container(
                                              margin: EdgeInsets.only(
                                                top: height / 30,
                                                right: width / 30,
                                              ),
                                              height: height / 8,
                                              child: newdata.isEmpty
                                                  ? Center(
                                                      child: Container(
                                                          child: Text(
                                                              "No Category found")))
                                                  : ListView.builder(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      shrinkWrap: true,
                                                      itemCount: newdata.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pushNamed(
                                                                    CategoryPage
                                                                        .routeName,
                                                                    arguments:
                                                                        newdata[index]
                                                                            .id);
                                                          },
                                                          child: Column(
                                                            children: [
                                                              CircleAvatar(
                                                                  backgroundColor:
                                                                      Color(
                                                                          0xffF3F3F3),
                                                                  radius:
                                                                      height /
                                                                          40,
                                                                  child: Icon(
                                                                    newdata[index]
                                                                        .icons,
                                                                    color: Colors
                                                                        .black,
                                                                    size:
                                                                        height /
                                                                            50,
                                                                  )),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top: height /
                                                                            100),
                                                                child: Text(
                                                                  newdata[index]
                                                                      .name,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          height /
                                                                              55,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      }),
                                            ))
                                          ])
                                        : Container(),
                                    Container(
                                      height: height / 16,
                                      margin: EdgeInsets.only(
                                          top: height / 30, right: width / 50),
                                      child: TextField(
                                        obscureText: false,
                                        controller: shopname,
                                        textAlign: TextAlign.left,
                                        decoration: kEditDecoration.copyWith(
                                          hintText: "Shop Name",
                                          labelText: "Shop Name",
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: height / 30, right: width / 50),
                                      child: TextField(
                                        obscureText: false,
                                        controller: producttitle,
                                        textAlign: TextAlign.left,
                                        decoration: kEditDecoration.copyWith(
                                          hintText: "Product Title",
                                          labelText: "Product Title",
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: height / 30, right: width / 50),
                                      child: TextField(
                                        obscureText: false,
                                        controller: description,
                                        textAlign: TextAlign.left,
                                        decoration: kEditDecoration.copyWith(
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: height / 17,
                                              horizontal: 10),
                                          hintText: "Description",
                                          labelText: "Description",
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: height / 16,
                                      margin: EdgeInsets.only(
                                          top: height / 30, right: width / 50),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(
                                            width: 1.0,
                                            color: Colors.black38,
                                          )),
                                      padding: EdgeInsets.only(
                                          top: height / 200, left: width / 40),
                                      child: FormBuilderTextField(
                                        readOnly: true,
                                        onTap: () {
                                          setState(() {
                                            storestatus = !storestatus;
                                          });
                                        },
                                        name: "Textfield",
                                        onChanged: onitemchanged,
                                        decoration: InputDecoration(
                                            suffixIcon: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    storestatus = !storestatus;
                                                  });
                                                },
                                                child: Icon(
                                                  Icons.expand_more,
                                                  color: Colors.black,
                                                )),
                                            hintText: "Select Store Status",
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none),
                                      ),
                                    ),
                                    storestatus == true
                                        ? Container(
                                            margin: EdgeInsets.only(
                                                top: height / 50),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                          width: 1.0,
                                                          color: Colors.black38,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0)),
                                                    height: height / 16,
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 3,
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                selecttime
                                                                    .selectotime(
                                                                        context);
                                                              });
                                                            },
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          width /
                                                                              6),
                                                              child: Text(
                                                                selecttime
                                                                        .openingtime
                                                                        .hour
                                                                        .toString() +
                                                                    ":" +
                                                                    selecttime
                                                                        .openingtime
                                                                        .minute
                                                                        .toString(),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: IconButton(
                                                            onPressed: () {
                                                              setState(() {
                                                                selecttime
                                                                    .selectotime(
                                                                        context);
                                                              });
                                                            },
                                                            icon: Icon(
                                                              Icons.schedule,
                                                              color: Colors
                                                                  .black38,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        selecttime.selectctime(
                                                            context);
                                                      });
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          right: width / 40,
                                                          left: width / 45),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                            width: 1.0,
                                                            color:
                                                                Colors.black38,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0)),
                                                      height: height / 16,
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            flex: 3,
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          width /
                                                                              6),
                                                              child: Text(
                                                                selecttime
                                                                        .closingtime
                                                                        .hour
                                                                        .toString() +
                                                                    ":" +
                                                                    selecttime
                                                                        .closingtime
                                                                        .minute
                                                                        .toString(),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: IconButton(
                                                              onPressed: () {
                                                                setState(() {
                                                                  selecttime
                                                                      .selectctime(
                                                                          context);
                                                                });
                                                              },
                                                              icon: Icon(
                                                                Icons.schedule,
                                                                color: Colors
                                                                    .black38,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        : SizedBox.shrink(),
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            checkbox = !checkbox;
                                          });
                                        },
                                        child: CheckboxText(
                                          check: checkbox,
                                          text: "Delivery Availability",
                                        )),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                            right: width / 40,
                                            top: height / 40,
                                          ),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text("Location",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: height / 50)),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            SchedulerBinding.instance
                                                .addPostFrameCallback((_) {
                                              // add your code here.

                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          EditLocation(
                                                            newlat: widget.lati,
                                                            newlon: widget.loti,
                                                          )));
                                            });
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                right: width / 20,
                                                top: height / 40),
                                            child: Text("Edit",
                                                style: TextStyle(
                                                    color: Colors.orange,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: height / 47)),
                                          ),
                                        )
                                      ],
                                    ),
                                    isloading == false
                                        ? Container(
                                            height: height / 9,
                                            child: Center(
                                                child:
                                                    CircularProgressIndicator()),
                                          )
                                        : Container(
                                            margin: EdgeInsets.only(
                                                top: height / 30,
                                                right: width / 40),
                                            height: height / 9,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1.0,
                                                    color: Colors.black38),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                color: Color(0xffF3F3F3)),
                                            child: FlutterMap(
                                                children: [],
                                                options: MapOptions(
                                                  center: (widget.lati != null
                                                      ? LatLng(widget.lati,
                                                          widget.loti)
                                                      : LatLng(
                                                          latitude, longitude)),
                                                  zoom: 13.0,
                                                ),
                                                layers: [
                                                  new TileLayerOptions(
                                                      urlTemplate:
                                                          "https://api.mapbox.com/styles/v1/saugatt/ckojr740403wm17pc74woklrr/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoic2F1Z2F0dCIsImEiOiJja29iMW9lNjYwNGhwMm9zOWZqMmV5OGlvIn0.F_v1FzPMI4YaTvOjLX0hxA",
                                                      additionalOptions: {
                                                        'access_token':
                                                            "pk.eyJ1Ijoic2F1Z2F0dCIsImEiOiJja29iMW9lNjYwNGhwMm9zOWZqMmV5OGlvIn0.F_v1FzPMI4YaTvOjLX0hxA",
                                                        'id':
                                                            "mapbox.mapbox-streets-v8"
                                                      }),
                                                  MarkerLayerOptions(markers: [
                                                    Marker(
                                                      width: 80.0,
                                                      height: 80.0,
                                                      point:
                                                          (widget.lati != null
                                                              ? LatLng(
                                                                  widget.lati,
                                                                  widget.loti)
                                                              : LatLng(latitude,
                                                                  longitude)),
                                                      builder: (ctx) =>
                                                          new Container(
                                                        child: Icon(Icons.place,
                                                            color: Colors.red),
                                                      ),
                                                    )
                                                  ]),
                                                ])),
                                    Container(
                                      margin: EdgeInsets.only(
                                          right: width / 20, top: height / 30),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Payment Method",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: height / 50)),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).pushNamed(
                                                  EditPayment.routename,
                                                );
                                              },
                                              child: Text("Edit",
                                                  style: TextStyle(
                                                      color: Colors.orange,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: height / 47)),
                                            )
                                          ]),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                      ),
                      payment.addpay.length == 0
                          ? Container()
                          : Row(children: [
                              Expanded(
                                  child: Container(
                                margin: EdgeInsets.only(
                                    right: width / 30, left: width / 30),
                                height: height / 7,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: payment.addpay.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.all(width / 80),
                                        child: Container(
                                          margin: EdgeInsets.only(
                                            top: height / 50,
                                          ),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1.0,
                                                  color: Colors.black38),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              color: Color(0xffF3F3F3)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image(
                                              height: height / 15,
                                              width: width / 3,
                                              image: AssetImage(
                                                payment.addpay[index].image,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              ))
                            ]),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            print(latitude);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyProfile()));
                          },
                          child: Container(
                              width: double.infinity,
                              height: height / 17,
                              margin: EdgeInsets.only(
                                  top: height / 50,
                                  left: width / 35,
                                  right: width / 35,
                                  bottom: height / 50),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Color(0xffF08626),
                              ),
                              child: Center(
                                child: Text(
                                  "Create Store",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: height / 40),
                                ),
                              )),
                        ),
                      ),
                    ],
                  )))),
    );
  }
}
