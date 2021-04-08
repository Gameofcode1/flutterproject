import 'package:flutter/material.dart';
import '../constant.dart';

class ContainerText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
                color: Color(0xffF3F3F3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, left: 18.0),
                      child: Text("Men's Wool Runners-Natural Grey",
                          textAlign: TextAlign.start, style: kTitleDesc),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10.0, left: 18.0),
                          child: Text("Npr 5000", style: kTitleDesc),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                          child: Text(
                            "NPR 7000 /-",
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,fontWeight: FontWeight.w200),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 18.0),
                          child: Text(
                            "70% off",
                            style: TextStyle(color: Colors.orange),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 10.0, left: 18.0, bottom: 20.0),
                          child: Icon(Icons.place),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 6.0, bottom: 15.0),
                          child: Text(
                            "4km away -durbarmagh, kathmandu",
                            style: kTitleDesc.copyWith(fontWeight: FontWeight.w300,
                            fontSize: 13.0
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
    );
  }
}