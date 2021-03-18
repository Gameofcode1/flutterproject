import 'package:flutter/material.dart';
import 'resturents.dart';
import "../widgets/addedresturent.dart";

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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: resturents.length,
        itemBuilder: (BuildContext context, int index) {
          return AddedRestaurents(
              restaurant: resturents[index].restaurant,
              distance: resturents[index].distance,
              detail: resturents[index].detail,
              activeicon: resturents[index].activeicon,
              status: resturents[index].status);
        });
  }
}
