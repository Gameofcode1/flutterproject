import 'package:flutter/material.dart';
class NewNotification
{
 IconData icons;
 String heading;
 String description;
 AssetImage image;
 String explore;
 Widget line;


 NewNotification({@required this.icons,@required this.heading,@required this.description,this.image,this.line,this.explore});

}
