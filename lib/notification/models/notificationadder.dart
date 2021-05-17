
import 'package:flutter/material.dart';
import 'newnotification.dart';
import '../widgets/departmentalstore.dart';
import '../widgets/departmentalstoreshimmer.dart';

class NotificationAdder extends StatefulWidget {

  @override
  _NotificationAdderState createState() => _NotificationAdderState();
}

class _NotificationAdderState extends State<NotificationAdder> {
  List<NewNotification> _notifications = [
    NewNotification(
      icons: Icons.notifications_none,
       heading: "Departmental Store",
      description: "Big mart store added into your area", 
      
      
    ),
      NewNotification(
      icons: Icons.notifications_none,
      heading:"Explorby cheapest grocery shop near you",
       description: "Big mart store added in your area",
      image: AssetImage("images/fruits.jpg"),
   
    ),
   
  ];
bool time=false;

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
    return ListView.builder(
     
     
        itemCount: _notifications.length,
         physics:
            time == false ? NeverScrollableScrollPhysics() : ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return time==false?DepartmentalStoreShimmer(imagecheck:_notifications[index].image!=null?true:false):
          StoreDetail(
            icons: _notifications[index].icons,
            description: _notifications[index].description,
            heading: _notifications[index].heading,
            imagee: _notifications[index].image,
          );
        });
    
  }
}
