import 'package:flutter/material.dart';

class Foods extends StatelessWidget {
  final List<String> products;

  Foods([this.products = const []]) {
    //[optional arguments]
    print('foods: constructor');
  }

  @override
  Widget build(BuildContext context) {
    print('foods: build()');
    return Column(
      children: products
          .map(
            (element) => Card(
              child: Row(
                children: <Widget>[
                  Image.asset(
                    'assets/test_bakeryimages/headimage.jpg',
                    height: 100,
                    width: 100,
                  ),
                  Padding(padding: EdgeInsets.all(10),
                  child: Text(element)
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
