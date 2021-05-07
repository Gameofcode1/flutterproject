import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateAndTimeSlect with ChangeNotifier {
  TimeOfDay openingtime;
  TimeOfDay closingtime;

  void gettime() {
    if (openingtime == null) {
      openingtime = TimeOfDay.now();
    }
    if (closingtime == null) {
      closingtime = TimeOfDay.now();
    }
    notifyListeners();
  }

  Future selectctime(BuildContext context) async {
    TimeOfDay ctime =
        await showTimePicker(context: context, initialTime: closingtime);

    if (ctime != null) {
      closingtime = ctime;
    }
    notifyListeners();
  }

  Future selectotime(BuildContext context) async {
    TimeOfDay otime =
        await showTimePicker(context: context, initialTime: openingtime);

    if (otime != null) {
      openingtime = otime;
    }
    notifyListeners();
  }
}
