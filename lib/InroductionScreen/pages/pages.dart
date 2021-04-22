import 'package:flutter/material.dart';

final List<Widget> images = [
  Stack(children: [

    Container(
      height:double.infinity,
      width: double.infinity,
     child: Image(image: AssetImage( 'images/shoe.jpg')),),

     Positioned(
       
            child: Container(
         child:
         Text("saugat")
       ),
     )

  
  ],
  
  ),
  Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('images/shoe2.jpg'),
        fit: BoxFit.fill,
      ),
    ),
  ),
  Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('images/shoe3.jpg'),
        fit: BoxFit.fill,
      ),
    ),
  ),
];
