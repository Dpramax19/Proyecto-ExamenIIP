import 'package:flutter/material.dart';
import 'package:shalystore/constants.dart';

import 'featurred_plants.dart';
import 'header_with_seachbox.dart';
import 'recomend_plants.dart';
import 'title_with_more_bbtn.dart';

class Plant {
  String image;
  String title;
  String country;
  double price;

  Plant(this.image, this.title, this.country, this.price);
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  final _items = [
    Plant("assets/images/image_1.png", "Wish Create", "USA", 150.0),
    Plant("assets/images/image_2.png", "Ahink indl", "USA", 160.0),
    Plant("assets/images/image_3.png", "Licra Bert", "USA", 200.0),
  ];

  void increment() {
    setState(() {
      _items.add(Plant("assets/images/image_4.png", "Burn dock", "USA", 150.0));
      _items.add(Plant("assets/images/image_5.png", "Airk Fuck", "CANADÁ", 150.0));
      _items.add(Plant("assets/images/image_6.png", "Wondek", "USA", 140.0));
      _items.add(Plant("assets/images/image_7.png", "Ads farl", "USA", 130.0));
      _items.add(Plant("assets/images/image_8.png", "Cerf Fac", "USA", 130.0));
      _items.add(Plant("assets/images/image_9.png", "Pack Luck", "USA", 140.0));
    });
  }

  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          TitleWithMoreBtn(title: "Recomended", press: () {
            increment();
          }),
          RecomendsPlants(items: _items,),
          TitleWithMoreBtn(title: "Featured Clothes", press: () {}, showMoreButton: false,),
          const FeaturedPlants(),
          const SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}
