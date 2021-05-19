import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class DepartmentalStoreShimmer extends StatelessWidget {
  final bool imagecheck;
  DepartmentalStoreShimmer({this.imagecheck});


  @override
  Widget build(BuildContext context) {
     var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
     
      child: Padding(
      padding: EdgeInsets.only(top: height / 60),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Shimmer.fromColors(
            baseColor: Colors.grey[300],
                        highlightColor: Colors.grey[100],
                      child: (CircleAvatar(
                        backgroundColor: Colors.grey[300],
              radius: height / 65,
              
            )),
          ),
          SizedBox(
            width: width / 28,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Shimmer.fromColors(
                        baseColor: Colors.grey[300],
                        highlightColor: Colors.grey[100],
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: height / 300, left: width / 80),
                          child: Container(
                              color: Colors.grey[300],
                              height: height / 40,
                              width: height / 6),
                        ),
                      ),
              SizedBox(
                height: 1.0,
              ),
              
              
              imagecheck?
              Shimmer.fromColors(
                        baseColor: Colors.grey[300],
                        highlightColor: Colors.grey[100],
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: height / 300, left: width / 80),
                          child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5)
                            )
                          ),
                              
                              height: height / 10,
                              width: height / 4),
                        ),
                      ):SizedBox.shrink() ,
       
            ],
          ),
        ],
      ),
      ));
      
    
  }
}