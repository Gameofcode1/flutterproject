import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../provider/payment.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    final paymentl = Provider.of<PaymentSelection>(context);

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      
        child: Container(
          margin: EdgeInsets.only(left: width / 100),
          child: GestureDetector(
            onTap: () {
              setState(() {
                paymentl.change();
              });
            },
            child: Container(
              margin: EdgeInsets.only(top: height / 150, right: width / 40),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1.0,
                      color:
                          paymentl.select ? Colors.green : Color(0xffF3F3F3)),
                  borderRadius: BorderRadius.circular(5.0),
                 color:
                          paymentl.select ? Colors.green.withOpacity(0.1) : Color(0xffF3F3F3)),
              child: Padding(
                padding: EdgeInsets.all(height / 30),
              
                  child: Image(
                    image: AssetImage(paymentl.image),
                   
                  
                ),
              ),
            ),
          ),
        ));
  }
}
