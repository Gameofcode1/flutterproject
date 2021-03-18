
import 'package:flutter/material.dart';
import 'newnotification.dart';
import '../widgets/departmentalstore.dart';

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


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
     
     
        itemCount: _notifications.length,
        itemBuilder: (BuildContext context, int index) {
          return StoreDetail(
            icons: _notifications[index].icons,
            description: _notifications[index].description,
            heading: _notifications[index].heading,
            imagee: _notifications[index].image,
          );
        });
    
  }
}
