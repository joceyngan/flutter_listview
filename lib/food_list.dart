import 'package:flutter/material.dart';
import 'dart:convert';
import 'food_details.dart';

class FoodList extends StatefulWidget {
  final String foodList;

  FoodList({this.foodList = 'Cakes'}) {
    print('food list: constructor');
  }

  @override
  State<StatefulWidget> createState() {
    print('food list: createState()');
    return FoodListState();
  }
}

class FoodListState extends State<FoodList> {
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

    return Column(children: [
      Container(
        margin: EdgeInsets.all(10),
        /*
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              _products.add('more foods');
              print('food list: _products: ');
            });
          },
          child: Text('Add Foods'),
        ),*/
      ),
      //Foods(_products)
      Center(
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
                          children: <Widget>[
                            Container(
                                height: 100,
                                width: 100,
                                child: Image.asset(
                                    'assets/test_bakeryimages/vanillacake.jpg')),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            FoodDetails(newProductList)));
                              }, //to detail view
                              child: Text(
                                newProductList[index]['Name'],
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                            Text(
                              newProductList[index]['Price'],
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: newProductList == null ? 0 : newProductList.length,
                );
              }))
    ]);
  }
}
