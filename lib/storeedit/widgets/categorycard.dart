import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String title;

  CategoryCard({this.icon, this.title});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0), color: Color(0xffF3F3F3)),
    
         
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: height / 30,
                  color: Colors.black,
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: height / 60,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                )
              ]),
        );
  }
}
