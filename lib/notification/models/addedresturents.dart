import 'package:flutter/material.dart';
import 'resturents.dart';
import "../widgets/addedresturent.dart";
import '../widgets/resturantsshimmer.dart';
class AddedResturent extends StatefulWidget {
  @override
  _AddedResturentState createState() => _AddedResturentState();
}

class _AddedResturentState extends State<AddedResturent> {
  List<Resturents> resturents = [
    Resturents(
        restaurant: "Ramro Restaurent",
        distance: 200,
        activeicon: Colors.green,
        status: Colors.green,
        detail: "Bishal Chowk Lagankhel"),
    Resturents(
        restaurant: "Ramro Restaurent",
        distance: 200,
        activeicon: Colors.green,
        status: Colors.green,
        detail: "Bishal Chowk Lagankhel"),
    Resturents(
        restaurant: "Ramro Restaurent",
        distance: 200,
        activeicon: Colors.green,
        status: Colors.green,
        detail: "Bishal Chowk Lagankhel"),
    Resturents(
        restaurant: "Ramro Restaurent",
        distance: 200,
        activeicon: Colors.greenAccent,
        status: Colors.green,
        detail: "Bishal Chowk Lagankhel")
  ];

  bool time = false;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        time = true;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics:time==true? ScrollPhysics():NeverScrollableScrollPhysics(),
        itemCount: resturents.length,
        itemBuilder: (BuildContext context, int index) {
          return time==false?ResturantSlimmer():AddedRestaurents(
              restaurant: resturents[index].restaurant,
              distance: resturents[index].distance,
              detail: resturents[index].detail,
              activeicon: resturents[index].activeicon,
              status: resturents[index].status);
        });
  }
}
