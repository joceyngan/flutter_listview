import 'package:flutter/material.dart';

import 'package:flutter_listview/product.dart';

class FoodDetails extends StatelessWidget {
  final Product product;

  FoodDetails(this.product) {
    print('food details: constructor , Product Name: '+ product.name);
  }

  @override
  Widget build(BuildContext context) {
    print('food details: build()');
    return Column(
      children: <Widget>[
        Image.asset(
          'assets/test_bakeryimages/headimage.jpg', //temp image
        ),
        Padding(padding: EdgeInsets.all(10), child: Text('some details...')),
      ],
    );
  }
}
