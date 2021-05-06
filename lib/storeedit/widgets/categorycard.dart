import 'package:flutter/material.dart';
import 'package:myprofile/storeedit/provider/catclass.dart';
import 'package:provider/provider.dart';

class CategoryCard extends StatefulWidget with ChangeNotifier {
  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var data = Provider.of<Catclass>(context);
    return Padding(
      padding:  EdgeInsets.only(left: width/140,bottom:height/100,right: width/140),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
             color:data.check?Color(0xffF08626).withOpacity(0.6): Color(0xffF3F3F3),

            
            ),
        child: GestureDetector(
          onTap: () {
            setState(() {
              data.onclick();
            });
          },
          child: Container(
            width: width / 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(width:1,color:data.check?Color(0xffF08626): Color(0xffF3F3F3) )
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    data.icon,
                    size: height / 30,
                    color: Colors.black,
                  ),
                  Text(
                    data.title,
                    style: TextStyle(
                        fontSize: height / 60,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
