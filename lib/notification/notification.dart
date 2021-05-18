import 'package:flutter/material.dart';
import 'package:myprofile/notification/models/fooddealsadder.dart';
import 'package:shimmer/shimmer.dart';
import 'constant.dart';
import './models/notificationadder.dart';
import 'package:intl/intl.dart';
import './widgets/buttons.dart';
import './models/addedresturents.dart';

class NotificationSystem extends StatefulWidget {
  @override
  _NotificationSystemState createState() => _NotificationSystemState();
}

class _NotificationSystemState extends State<NotificationSystem> {
  bool time = false;
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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(
            top: height / 120,
          ),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width / 40),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: height / 39,
                      ),
                    ),
                  ),
                  Text("Notifications",
                      style: kNotification.copyWith(fontSize: height / 35)),
                  SizedBox(
                    width: width / 7,
                  )
                ],
              ),
              Container(
                  margin: EdgeInsets.only(top: height / 130, left: width / 30),
                  height: height / 3.5,
                  width: double.infinity,
                  child: NotificationAdder()),
              (time)
                  ? Container(
                      margin: EdgeInsets.only(
                          left: width / 8,
                          top: height / 140,
                          right: width / 1.6),
                      child: NewButton(
                        titlee: "Explore >",
                      ),
                      height: height / 28,
                      width: width / 5,
                      decoration: BoxDecoration(
                        color: Colors.orange[600],
                        borderRadius: BorderRadius.circular(5.0),
                      ))
                  : Shimmer.fromColors(
                      baseColor: Colors.grey[300],
                      highlightColor: Colors.grey[100],
                      child: Container(
                          margin: EdgeInsets.only(
                              left: width / 8,
                              top: height / 140,
                              right: width / 1.6),
                          height: height / 28,
                          width: width / 5,
                          decoration: BoxDecoration(
                            color: Colors.teal[300],
                            borderRadius: BorderRadius.circular(5.0),
                          )),
                    ),
                    (time)?
              SizedBox(
                height: height / 25,
                width: double.infinity,
                child: Divider(
                  color: Colors.black38,
                ),
              ):SizedBox.shrink(),
              (time)
                  ? Container(
                      margin: EdgeInsets.only(left: width / 30),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            (CircleAvatar(
                              radius: height / 65,
                              backgroundColor: Colors.orange[50],
                              child: Icon(
                                Icons.notifications_none,
                                size: height / 47,
                                color: Colors.orange[600],
                              ),
                            )),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text("food deal near you",
                                style:
                                    kFoodDeal.copyWith(fontSize: height / 58)),
                          ]),
                    )
                  : Container(
                      margin: EdgeInsets.only(left: width / 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Shimmer.fromColors(
                              baseColor: Colors.grey[300],
                              highlightColor: Colors.grey[100],
                              child: (CircleAvatar(
                                radius: height / 65,
                                backgroundColor: Colors.grey[300],
                              ))),
                          SizedBox(
                            width: 10.0,
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300],
                            highlightColor: Colors.grey[100],
                            child: Container(
                                color: Colors.grey[300],
                                height: height / 70,
                                width: height / 6),
                          )
                        ],
                      ),
                    ),
              Container(
                margin: EdgeInsets.only(left: width / 10, bottom: height / 130),
                height: height / 5,
                width: width,
                child: FoodDealsAdder(),
              ),
              Container(
                  margin: EdgeInsets.only(
                      left: width / 7, bottom: height / 105, top: height / 200),
                  child: (time)
                      ? Text(
                          DateFormat.MMMMd().add_jms().format(
                                DateTime.now(),
                              ),
                          style: kDateAndTime.copyWith(fontSize: height / 80))
                      : Shimmer.fromColors(
                          baseColor: Colors.grey[300],
                          highlightColor: Colors.grey[100],
                          child: Container(
                              color: Colors.grey[300],
                              height: height / 70,
                              width: height / 10),
                        )),
              time
                  ? Container(
                      margin: EdgeInsets.only(
                          left: width / 8,
                          bottom: height / 50,
                          right: width / 1.6),
                      child: NewButton(
                        titlee: "See All >",
                      ),
                      height: height / 28,
                      width: width / 5,
                      decoration: BoxDecoration(
                        color: Colors.orange[600],
                        borderRadius: BorderRadius.circular(5.0),
                      ))
                  : Shimmer.fromColors(
                      baseColor: Colors.grey[300],
                      highlightColor: Colors.grey[100],
                      child: Container(
                          margin: EdgeInsets.only(
                              left: width / 8,
                              top: height / 140,
                              bottom: height / 50,
                              right: width / 1.6),
                          height: height / 28,
                          width: width / 5,
                          decoration: BoxDecoration(
                            color: Colors.teal[300],
                            borderRadius: BorderRadius.circular(5.0),
                          )),
                    ),
              (time)
                  ? Container(
                      margin: EdgeInsets.only(left: width / 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          (CircleAvatar(
                            radius: height / 65,
                            backgroundColor: Colors.orange[50],
                            child: Icon(
                              Icons.notifications_none,
                              size: height / 47,
                              color: Colors.orange[600],
                            ),
                          )),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text("Newly added Restaurants in your town",
                              style: kFoodDeal.copyWith(
                                  fontSize: height / 58, letterSpacing: 0.3)),
                        ],
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.only(left: width / 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Shimmer.fromColors(
                              baseColor: Colors.grey[300],
                              highlightColor: Colors.grey[100],
                              child: (CircleAvatar(
                                radius: height / 65,
                                backgroundColor: Colors.grey[300],
                              ))),
                          SizedBox(
                            width: 10.0,
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300],
                            highlightColor: Colors.grey[100],
                            child: Container(
                                color: Colors.grey[300],
                                height: height / 70,
                                width: height / 6),
                          )
                        ],
                      ),
                    ),
              Container(
                margin: EdgeInsets.only(left: width / 9),
                height: height / 10,
                width: width,
                child: AddedResturent(),
              ),
              Container(
                  margin: EdgeInsets.only(
                      left: width / 7, top: height / 140, bottom: height / 70),
                  child: (time)
                      ? Text(
                          DateFormat.MMMMd().add_jms().format(
                                DateTime.now(),
                              ),
                          style: kDateAndTime.copyWith(fontSize: height / 80))
                      : Shimmer.fromColors(
                          baseColor: Colors.grey[300],
                          highlightColor: Colors.grey[100],
                          child: Container(
                              color: Colors.grey[300],
                              height: height / 70,
                              width: height / 6),
                        )),
              time
                  ? Container(
                      margin:
                          EdgeInsets.only(left: width / 8, right: width / 1.6),
                      child: NewButton(
                        titlee: "See All >",
                      ),
                      height: height / 28,
                      width: width / 5,
                      decoration: BoxDecoration(
                        color: Colors.orange[600],
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    )
                  : Shimmer.fromColors(
                      baseColor: Colors.grey[300],
                      highlightColor: Colors.grey[100],
                      child: Container(
                          margin: EdgeInsets.only(
                              left: width / 8,
                              top: height / 140,
                              bottom: height / 80,
                              right: width / 1.6),
                          height: height / 28,
                          width: width / 5,
                          decoration: BoxDecoration(
                            color: Colors.teal[300],
                            borderRadius: BorderRadius.circular(5.0),
                          )),
                    ),
              Container(
                  margin: EdgeInsets.only(top: height / 130, left: width / 30),
                  height: height / 3.5,
                  width: double.infinity,
                  child: NotificationAdder()),
              time
                  ? Container(
                      margin:
                          EdgeInsets.only(left: width / 8, right: width / 1.6),
                      child: NewButton(
                        titlee: "See All >",
                      ),
                      height: height / 28,
                      width: width / 5,
                      decoration: BoxDecoration(
                        color: Colors.orange[600],
                        borderRadius: BorderRadius.circular(5.0),
                      ))
                  : Shimmer.fromColors(
                      baseColor: Colors.grey[300],
                      highlightColor: Colors.grey[100],
                      child: Container(
                          margin: EdgeInsets.only(
                              left: width / 8,
                              top: height / 140,
                              right: width / 1.6),
                          height: height / 28,
                          width: width / 5,
                          decoration: BoxDecoration(
                            color: Colors.teal[300],
                            borderRadius: BorderRadius.circular(5.0),
                          )),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
