import 'package:flutter/material.dart';

import './add_food.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('main: build()');
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('A List'),
          ),
          body: AddFood(foodList: 'some foods',),
    ));
  }
}
