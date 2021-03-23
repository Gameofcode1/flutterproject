import 'package:flutter/material.dart';
import '../constant.dart';

class AddedRestaurents extends StatelessWidget {
  final String restaurant;
  final int distance;
  final String detail;
  final Color activeicon;
  final Color status;

  AddedRestaurents(
      {this.restaurant,
      this.distance,
      this.detail,
      this.activeicon,
      this.status});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(
          left: height / 130, right: height / 130, top: height / 160),
      padding: EdgeInsets.only(
          left: width / 30, right: width / 20, top: height / 150),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black26,
          ),
          borderRadius: BorderRadius.all(Radius.circular(6))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(restaurant,
              style: kFoodDeal.copyWith(
                  fontSize: height / 70, letterSpacing: 0.6)),
          Container(
            margin: EdgeInsets.only(top: height / 90),
            child: Row(
              children: [
                Icon(
                  Icons.place,
                  size: height / 53,
                ),
                Text(
                  "$distance away",
                  style: kDistance.copyWith(fontSize: height / 85),
                ),
                SizedBox(width: width / 40),
                Icon(
                  Icons.circle,
                  size: height / 80,
                  color: activeicon,
                ),
                SizedBox(width: width / 90),
                Text(
                  "Open",
                  style: kDateAndTime.copyWith(
                      color: status, fontSize: height / 85),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height / 110),
            child: Text(
              "Bischal Chowk,Lagankhel",
              style: kDateAndTime.copyWith(
                  fontSize: height / 90, letterSpacing: 0.6),
            ),
          )
        ],
      ),
    );
  }
}
