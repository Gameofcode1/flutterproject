import 'package:flutter/material.dart';

class ProductAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                Icon(Icons.arrow_back_ios),
                Text("Product Add"),
                SizedBox()
              ],

            )
          ],

        ),
      ),
      
    );
  }
}