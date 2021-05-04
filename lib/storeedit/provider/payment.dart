import 'package:flutter/foundation.dart';

class PaymentSelection with ChangeNotifier {
  bool select;
  final String name;
  final String image;

  PaymentSelection({this.name, this.image, this.select = false});


  void change(){
    select=!select;
  }
}


