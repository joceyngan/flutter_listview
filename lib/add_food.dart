import 'package:flutter/material.dart';

import './foods.dart';

class AddFood extends StatefulWidget {
  final String foodList;

  AddFood({this.foodList = 'Cakes'}){
    print('add_food: constructor');
  }

  @override
  State<StatefulWidget> createState() {
    print('add_food: createState()');
    return AddFoodState();
  }
}

class AddFoodState extends State<AddFood> {
  List<String> _products = [];

  @override
  //execute when the widget is drawn onto the screen for the first time
  //runs before build()
  void initState() {
    print('add_food: initState()');
    _products.add(widget.foodList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('add_food: build()');
    return Column(children: [
      Container(
        margin: EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              _products.add('more foods');
              print('add_food: _products: ');
            });
          },
          child: Text('Add Foods'),
        ),
      ),
      Foods(_products)
    ]);
  }
}
