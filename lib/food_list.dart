import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

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
  List data = [];

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

    Future _loadJSON() async {
      print('food list: _loadJSON()');
      String data = 
        await rootBundle.loadString('assets/test_bakerylist.json');
      Map<String, dynamic> jsonProducts = json.decode(data);
      String name = jsonProducts[0]['Name'];
      print(name); //for checking if can load json
    }
/*  //another method to load json
    Future _loadJSON() async {
      String jsonProducts = 
        await DefaultAssetBundle.of(context)
          .loadString('assets/test_bakerylist.json');
      print(jsonProducts); //checking if can load json
    }
*/   
    _loadJSON();

    print('food list: before return statement');
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
                        Container(height: 100, width: 100, child: Image.asset(
                            //temp image
                            'assets/test_bakeryimages/vanillacake.jpg')),
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
