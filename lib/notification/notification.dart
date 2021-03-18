import 'package:flutter/material.dart';
import 'package:myprofile/notification/models/fooddealsadder.dart';
import 'constant.dart';
import './models/notificationadder.dart';
import 'package:intl/intl.dart';
import './widgets/buttons.dart';

import './models/addedresturents.dart';

class NotificationSystem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(
            top: height / 45,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width / 15),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: height / 40,
                    ),
                  ),
                  Text("Notifications", style: kNotification),
                  SizedBox(
                    width: width / 7,
                  )
                ],
              ),
              Container(
                  margin: EdgeInsets.only(top: height / 27, left: width / 30),
                  height: height / 3.8,
                  width: double.infinity,
                  child: NotificationAdder()),
              Container(
                  margin: EdgeInsets.only(left: width / 8, top: height / 120),
                  child: NewButton(
                    titlee: "Explore >",
                  ),
                  height: height / 30,
                  width: width / 6,
                  decoration: BoxDecoration(
                    color: Colors.orange[600],
                    borderRadius: BorderRadius.circular(5.0),
                  )),
              SizedBox(
                height: height / 25,
                width: double.infinity,
                child: Divider(
                  color: Colors.black38,
                ),
              ),
              Container(
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
                          style: kFoodDeal.copyWith(fontSize: height / 70)),
                    ]),
              ),
              Container(
                margin: EdgeInsets.only(left: width / 10, bottom: height / 130),
                height: height / 5.5,
                width: MediaQuery.of(context).size.width,
                child: FoodDealsAdder(),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: width / 7, bottom: height / 90, top: height / 140),
                child: Text(
                    DateFormat.MMMMd().add_jms().format(
                          DateTime.now(),
                        ),
                    style: kDateAndTime),
              ),
              Container(
                  margin: EdgeInsets.only(left: width / 8, bottom: height / 50),
                  child: NewButton(
                    titlee: "See All >",
                  ),
                  height: height / 30,
                  width: width / 6,
                  decoration: BoxDecoration(
                    color: Colors.orange[600],
                    borderRadius: BorderRadius.circular(5.0),
                  )),
              Container(
                margin: EdgeInsets.only(left: width / 45),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      (CircleAvatar(
                        radius: 11.0,
                        backgroundColor: Colors.orange[50],
                        child: Icon(
                          Icons.notifications_none,
                          color: Colors.orange[600],
                          size: height / 47,
                        ),
                      )),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text("Newly added Restaurants in your town",
                          style: kFoodDeal),
                    ]),
              ),
              Container(
                margin: EdgeInsets.only(left: width / 9),
                height: 90.0,
                width: MediaQuery.of(context).size.width,
                child: AddedResturent(),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: width / 7, top: height / 140, bottom: height / 70),
                child: Text(
                    DateFormat.MMMMd().add_jms().format(
                          DateTime.now(),
                        ),
                    style: kDateAndTime),
              ),
              Container(
                  margin: EdgeInsets.only(left: width / 8, bottom: height / 70),
                  child: NewButton(
                    titlee: "See All >",
                  ),
                  height: height / 30,
                  width: width / 6,
                  decoration: BoxDecoration(
                    color: Colors.orange[600],
                    borderRadius: BorderRadius.circular(5.0),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
