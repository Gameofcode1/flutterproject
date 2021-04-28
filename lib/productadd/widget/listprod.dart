import 'package:flutter/material.dart';

final Color umpress = Colors.black;
final List clothing = [
  ["clothing", "a"],
  ["1", "2", "3"],
  "ss"
];

class ListAdd extends StatefulWidget {
  @override
  _ListAddState createState() => _ListAddState();
}

class _ListAddState extends State<ListAdd> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Column(
        children: [
          for (int i = 0; i < clothing.length; i++)
            Text(clothing[i].toString()),
          Column(
            children: [
              for (int j = 0; j < clothing.length; j++)
                Text(clothing[j].toString())
            ],
          )
        ],
      ),
    ]);
  }
}
