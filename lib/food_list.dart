import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter_listview/product.dart';
import 'food_details.dart';

class FoodList extends StatefulWidget {
  FoodList() {
    print('food list: constructor');
  }

  @override
  State<StatefulWidget> createState() {
    print('food list: createState()');
    return _FoodListState();
  }
}

class _FoodListState extends State<FoodList> {
  List data;

  @override
  //execute when the widget is drawn onto the screen for the first time
  //runs before build()
  void initState() {
    print('food list: initState()');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('food list: build()');

    return Center(
        child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/test_bakerylist.json'),
            builder: (context, snapshot) {
              var newProductList = json.decode(snapshot.data.toString());
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                            height: 100,
                            width: 100,
                            child: Image.asset(
                                //temp image
                                'assets/test_bakeryimages/vanillacake.jpg'
                                )),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        FoodDetails(newProductList)));
                          }, //transition to detail view
                          child: Text(
                            newProductList[index]['Name'],
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ],
                    ),
                  ));
                },
                itemCount: newProductList == null ? 0 : newProductList.length,
              );
            }));
  }
}
