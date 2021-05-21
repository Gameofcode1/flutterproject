import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class ListShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     var height = MediaQuery.of(context).size.height;

    return              Container(
              height:height/2.4,
              margin: EdgeInsets.only(top: height / 35),
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(left: height / 95,top: height/100,right: height/95),
                      width: height / 9,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300],
                            highlightColor: Colors.grey[100],
                            child: Container(
                            
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.grey[300],
                              ),
                              height: height/10,
                              width: double.infinity,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            );
  }
} 