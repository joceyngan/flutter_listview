import 'package:flutter/material.dart';

import 'package:flutter_listview/product.dart';

class FoodDetails extends StatelessWidget {
  final List<Product> products;

  FoodDetails(this.products) {
    print('food details: constructor');
  }

  @override
  Widget build(BuildContext context) {
    print('food details: build()');
    return Column(
      children: <Widget>[
        Image.asset(
          'assets/test_bakeryimages/headimage.jpg', //temp image
        ),
        Padding(padding: EdgeInsets.all(10), child: Text('some details')),
      ],
    );
  }
}
