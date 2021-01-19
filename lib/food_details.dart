import 'package:flutter/material.dart';

import 'package:flutter_listview/product.dart';

class FoodDetails extends StatelessWidget {
  final Product product;

  FoodDetails(newProductList, {this.product}) {
    print('food details: constructor , Product Name: ');
  }

  @override
  Widget build(BuildContext context) {
    print('food details: build()');
    return Column(
      children: <Widget>[
        Image.asset(
          './lib/assets/test_bakeryimages/vanillacake.jpg', //temp image
        ),
        Padding(padding: EdgeInsets.all(10), child: Text('some details...')),
        Padding(padding: EdgeInsets.all(10), child: Text('more details...')),
      ],
    );
  }
}
