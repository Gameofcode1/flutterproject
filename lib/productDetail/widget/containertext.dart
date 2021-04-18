import 'package:flutter/material.dart';
import '../constant.dart';

class ContainerText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return  Container(
                color: Color(0xffF3F3F3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top:height/50, left: width/20),
                      child: Text("Men's Wool Runners-Natural Grey",
                          textAlign: TextAlign.start, style: kTitleDesc.copyWith(fontSize: height/40)),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top:height/100, left: width/20),
                          child: Text("Npr 5000", style: kTitleDesc.copyWith(fontSize: height/40)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top:height/100, left: width/20),
                          child: Text(
                            "NPR 7000 /-",
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,fontWeight: FontWeight.w200,
                                fontSize: height/55),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top:height/100, left: width/20),
                          child: Text(
                            "70% off",
                            style: TextStyle(color: Colors.orange,fontSize: height/60),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top:height/80, left: width/20, bottom: height/80),
                          child: Icon(Icons.place,size: height/35,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 6.0, bottom: 15.0),
                          child: Text(
                            "4km away -durbarmagh, kathmandu",
                            style: kTitleDesc.copyWith(fontWeight: FontWeight.w300,
                            fontSize: height/70
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