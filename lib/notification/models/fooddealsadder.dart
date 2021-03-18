import "../widgets/fooddeals.dart";
import 'package:flutter/material.dart';
import 'fooddeals.dart';

class FoodDealsAdder extends StatefulWidget {
  @override
  _FoodDealsAdderState createState() => _FoodDealsAdderState();
}

class _FoodDealsAdderState extends State<FoodDealsAdder> {
  List<FoodDeals> fooddeals = [
    FoodDeals(
        image: AssetImage("images/fruits.jpg"),
        title: "Honey Lime Combo",
        price: 400,
        previousprice: 450,
        resturantname: "ABC Resturant",
        distance: 100),
    FoodDeals(
        image: AssetImage("images/fruits.jpg"),
        title: "Honey Lime Combo",
        price: 400,
        previousprice: 450,
        resturantname: "ABC Resturant",
        distance: 100),
    FoodDeals(
        image: AssetImage("images/fruits.jpg"),
        title: "Honey Lime Combo",
        price: 400,
        previousprice: 450,
        resturantname: "ABC Resturant",
        distance: 100),
    FoodDeals(
        image: AssetImage("images/fruits.jpg"),
        title: "Honey Lime Combo",
        price: 400,
        previousprice: 450,
        resturantname: "ABC Resturant",
        distance: 100)
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: fooddeals.length,
        itemBuilder: (BuildContext context, int index) {
          return FoodDeal(
            images: fooddeals[index].image,
            headings: fooddeals[index].title,
            prices: fooddeals[index].price,
            previousprice: fooddeals[index].previousprice,
            resturents: fooddeals[index].resturantname,
            distance: fooddeals[index].distance,
          );
        });
  }
}
