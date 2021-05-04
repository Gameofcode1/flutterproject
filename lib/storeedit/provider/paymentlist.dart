import 'package:flutter/cupertino.dart';

import 'payment.dart';

import 'payment.dart';

class Paymentlist with ChangeNotifier {
  List<PaymentSelection> payment = [
    PaymentSelection(
      name: "eSawa",
      image: "images/nesewa.png",
    ),
    PaymentSelection(
      name: "eSawa",
      image: "images/fonepay.png",
    ),
    PaymentSelection(
      name: "eSawa",
      image: "images/khalti.png",
    )
  ];

  List<Widget> items = [];

  List<PaymentSelection> get addpay {
    return payment.where((element) => element.select).toList();
  }

  void change(bool change) {
    change = !change;
    notifyListeners();
  }

}