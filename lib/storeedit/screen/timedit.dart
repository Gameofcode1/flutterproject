import 'package:flutter/material.dart';
import 'package:myprofile/storeedit/provider/datetime.dart';
import 'package:myprofile/storeedit/storeedit.dart';
import 'package:provider/provider.dart';

class TimeEdit extends StatefulWidget {
  @override
  _TimeEditState createState() => _TimeEditState();
}

class _TimeEditState extends State<TimeEdit> {
  @override
  void initState() {
    super.initState();
    Provider.of<DateAndTimeSlect>(context, listen: false).gettime();
  }

  @override
  Widget build(BuildContext context) {
    var selecttime = Provider.of<DateAndTimeSlect>(context);
    var height = MediaQuery.of(context).size.height;

    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: width / 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      size: height / 29,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  Container(
                      child: Text(
                    "Edit Time",
                    style: TextStyle(
                        fontSize: height / 45, fontWeight: FontWeight.w800),
                  )),
                ],
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(bottom: height / 80),
                  height: height / 3,
                  width: width / 1.7,
                  child: Image(image: AssetImage("images/time.png")),
                ),
              ),
              Row(children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: EdgeInsets.only(
                      top: height / 20,
                      left: width / 37,
                    ),
                    child: Text(
                      "Opening Time",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: height / 42,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                      margin: EdgeInsets.only(
                          top: height / 20,
                          right: width / 40,
                          left: width / 45),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1.0,
                              color: Color(0xffDADADA).withOpacity(0.8)),
                          borderRadius: BorderRadius.circular(10.0)),
                      height: height / 16,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              margin: EdgeInsets.only(left: width / 6),
                              child: Text(
                                selecttime.openingtime.hour.toString() +
                                    ":" +
                                    selecttime.openingtime.minute.toString(),
                              ),
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  selecttime.selectotime(context);
                                });
                              },
                              icon: Icon(Icons.schedule, color: Colors.black38),
                            ),
                          ),
                        ],
                      )),
                ),
              ]),
              Row(children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: EdgeInsets.only(
                      top: height / 30,
                      left: width / 37,
                    ),
                    child: Text(
                      "Closing Time",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: height / 42,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                      margin: EdgeInsets.only(
                          top: height / 30,
                          right: width / 40,
                          left: width / 45),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1.0,
                              color: Color(0xffDADADA).withOpacity(0.8)),
                          borderRadius: BorderRadius.circular(10.0)),
                      height: height / 16,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              margin: EdgeInsets.only(left: width / 6),
                              child: Text(
                                selecttime.closingtime.hour.toString() +
                                    ":" +
                                    selecttime.closingtime.minute.toString(),
                              ),
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  selecttime.selectctime(context);
                                });
                              },
                              icon: Icon(
                                Icons.schedule,
                                color: Colors.black38,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ]),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => StoreEdit()));
                  },
                  child: Container(
                      width: width / 3,
                      height: height / 18,
                      margin: EdgeInsets.only(
                          top: height / 8,
                          left: width / 35,
                          right: width / 35,
                          bottom: height / 50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Color(0xffF08626).withOpacity(0.7),
                      ),
                      child: Center(
                        child: Text(
                          "Save",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white, fontSize: height / 40),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
