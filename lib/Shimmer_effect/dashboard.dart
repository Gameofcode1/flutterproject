import 'package:flutter/material.dart';

import 'photo_shimmer.dart';
import 'recentyadded_shimmer.dart';
import 'list_shimmer.dart';
import 'category_shimmer.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: ListView(
          children: [
            PhotoShimmer(),
            RecentlyAddedShimmer(),
            CategoryShimmer(),
            ListShimmer()
          ],
        ),
      )),
    );
  }
}
