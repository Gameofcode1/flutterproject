import 'package:flutter/material.dart';
import 'package:myprofile/storeedit/widgets/payment.dart';
import 'package:provider/provider.dart';
import 'package:myprofile/storeedit/provider/paymentlist.dart';
import '../widgets/payment.dart';
import 'package:myprofile/storeedit/storeedit.dart';

class EditPayment extends StatelessWidget {
  static const routename = "payment";

  @override
  Widget build(BuildContext context) {
    final payment = Provider.of<Paymentlist>(context).payment;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
            margin: EdgeInsets.only(top: height / 70, left: width / 70),
            child: Column(
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
                   
                  ],
                ),
                
                Center(
                  child: Container(
                      margin: EdgeInsets.only(bottom: height / 50),
                      child: Image(
                        image: AssetImage("images/pays.png"),
                        height: height / 4,
                      )),
                ),
                 Center(
                   child: Container(
                      margin: EdgeInsets.only(bottom: height / 70),
                      
                        child: Text("Payment Methods",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: height / 35)),
                      ),
                 ),
                 Center(
                   child: Container(
                      margin: EdgeInsets.only(bottom: height / 20),
                      
                        child: Text("Click on payment cards to toggle Selection and save",
                            style: TextStyle(
                              fontWeight:FontWeight.w300,
                                
                                fontSize: height / 55)),
                      ),
                 ),

                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(left: width / 20, right: width / 20),
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 8 / 4,
                          crossAxisSpacing: 3.0,
                          mainAxisSpacing: 5.0),
                      itemCount: payment.length,
                      itemBuilder: (BuildContext ctx, index) {
                        {
                          return ChangeNotifierProvider.value(
                            value: payment[index],
                            child: Container(
                              child: Payment(),
                            ),
                          );
                        }
                      }),
                )),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => StoreEdit()));
                    Provider.of<Paymentlist>(context).addpay;
                  },
                  child: Container(
                      margin:
                          EdgeInsets.only(left: width / 3, bottom: height / 20),
                      width: width / 3,
                      height: height / 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Color(0xffF08626),
                      ),
                      child: Center(
                        child: Text(
                          "Save",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white, fontSize: height / 50),
                        ),
                      )),
                ),
              ],
            )),
      ),
    );
  }
}
