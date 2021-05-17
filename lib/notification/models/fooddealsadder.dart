import "../widgets/fooddeals.dart";
import 'package:flutter/material.dart';
import 'fooddeals.dart';
import 'package:shimmer/shimmer.dart';
import '../widgets/foodnearyoushimmer.dart';

class FoodDealsAdder extends StatefulWidget {
  @override
  _FoodDealsAdderState createState() => _FoodDealsAdderState();
}

bool time = false;

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
        physics:
            time == false ? NeverScrollableScrollPhysics() : ScrollPhysics(),
        itemCount: fooddeals.length,
        itemBuilder: (BuildContext context, int index) {
          return time == false
              ?FoodNearYouShimmer()
              : FoodDeal(
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
