import 'package:flutter/material.dart';
import '../constant.dart';
import 'package:intl/intl.dart';


class StoreDetail extends StatelessWidget {
  final IconData icons;
  final String heading;
  final String description;
  final AssetImage imagee;
  final String newexplore;

  StoreDetail(
      {this.icons,
      this.description,
      this.heading,
      this.imagee,
      this.newexplore});

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(top: height/60),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (CircleAvatar(
            radius: height/65,
            backgroundColor: Colors.orange[50],
            child: Icon(
              icons,
              size: height/47,
              color: Colors.orange[600],
            ),
          )),
          SizedBox(
            width: width/28,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(heading, style: kFoodDeal.copyWith(fontSize: height/70)),
              SizedBox(
                height: 1.0,
              ),
              Text(description, style: kFoodDealDes.copyWith(fontSize: height/80,)),
              SizedBox(
                height: 1.0,
              ),
              (imagee == null)
                  ? SizedBox.shrink()
                  : Container(
                      height: height/8,
                      width: width/1.6,
                      decoration: BoxDecoration(),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Padding(
                            padding: EdgeInsets.only(top: height/95,bottom: height/95),
                            child: Image(
                              fit: BoxFit.cover,
                              image: imagee,
                              alignment: AlignmentDirectional.topStart,
                            ),
                          ))),
              SizedBox(
                height: height/200,
              ),
             
              Text(
                DateFormat.MMMMd().add_jms().format(
                      DateTime.now(),
                    ),
                style: kDateAndTime.copyWith(fontSize: height/90),
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}
