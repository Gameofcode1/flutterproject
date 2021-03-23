import 'package:flutter/material.dart';
import '../constant.dart';

class FoodDeal extends StatelessWidget {
  final AssetImage images;
  final String headings;
  final int prices;
  final int previousprice;
  final String resturents;
  final int distance;

  FoodDeal(
      {this.images,
      this.headings,
      this.prices,
      this.previousprice,
      this.resturents,
      this.distance});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(left: width / 45),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5.0),
                topRight: Radius.circular(5.0),
                bottomLeft: Radius.circular(5.0),
                bottomRight: Radius.circular(5.0))),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: Image(
                  fit: BoxFit.cover,
                  image: images,
                  height: height / 11,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height / 150, left: width / 40),
                child: Text(headings,
                    style: kFoodDealDes.copyWith(
                        fontSize: height / 70, letterSpacing: 0.8)),
              ),
              Row(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: height / 190, left: width / 40),
                    child: Text(
                      "NRP $prices/-".toString(),
                      style: kFoodDealDes.copyWith(
                          fontSize: height / 85,
                          color: Colors.orange[700],
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: height / 230, left: width / 70),
                    child: Text("$previousprice/-".toString(),
                        style: kFoodDealDes.copyWith(
                            fontSize: height / 90,
                            decoration: TextDecoration.lineThrough)),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: height / 300, left: width / 40),
                child: Text(
                  resturents,
                  style: kFoodDeal.copyWith(
                      fontSize: height / 75, letterSpacing: 0.5),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height / 250, left: width / 40),
                child: Text(
                  "$distance M away".toString(),
                  style: kFoodDealDes.copyWith(
                      fontSize: height / 95, letterSpacing: 0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
