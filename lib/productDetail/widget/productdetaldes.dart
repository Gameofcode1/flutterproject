import 'package:flutter/material.dart';
import '../constant.dart';

class Productdetaildes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "Product Detail",
              style: kTitleDesc.copyWith(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Text(
              "Product description goes here",
              style: kTitle.copyWith(fontWeight: FontWeight.w200),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text("full description",
                style: TextStyle(color: Colors.lightBlue)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              "Additional Information",
              style: kTitleDesc.copyWith(
                  fontSize: 14, fontWeight: FontWeight.w300),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Text(
              "Colors",
              style: kTitleDesc.copyWith(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
