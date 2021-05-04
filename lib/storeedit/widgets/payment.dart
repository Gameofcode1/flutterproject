import 'package:flutter/material.dart';

import 'package:myprofile/productadd/widget/checkboxand%20text.dart';

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
      margin: EdgeInsets.only(left: width / 30, top: height / 70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
              onTap: () {
                setState(() {
                  paymentl.change();
                });
              },
              child: CheckboxText(
                check: paymentl.select,
                text: paymentl.name,
              )),
          Container(
            margin: EdgeInsets.only(left: width / 20),
            child: Container(
              margin: EdgeInsets.only(top: height / 90),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1.0,
                      color: paymentl.select ? Colors.orange : Colors.black38),
                  borderRadius: BorderRadius.circular(5.0),
                  color: Color(0xffF3F3F3)),
              child: Padding(
                padding: EdgeInsets.all(height/50),
                child: Image(
                  image: AssetImage(paymentl.image),
                  height: height / 11,
                  width: width/2.5,

                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
