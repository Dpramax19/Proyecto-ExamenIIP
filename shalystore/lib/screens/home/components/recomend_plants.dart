import 'package:flutter/material.dart';
import 'package:shalystore/screens/details/details_screen.dart';
import 'body.dart';

import '../../../constants.dart';

class RecomendsPlants extends StatelessWidget {

  final List<Plant> items;

  const RecomendsPlants({
    required this.items,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: items.map((e) => RecomendPlantCard(
            image: e.image,
            title: e.title,
            country: e.country,
            price: e.price.toInt(),
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailsScreen(),
                ),
              );
            })).toList(),
      ),
    );
  }
}

class RecomendPlantCard extends StatelessWidget {
  const RecomendPlantCard({
    Key? key,
    required this.image,
    required this.title,
    required this.country,
    required this.price,
    required this.press,
  }) : super(key: key);

  final String image, title, country;
  final int price;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
        child: Column(
          children: <Widget>[
            Image.asset(image),
            GestureDetector(
              onTap: press,
              child: Container(
                padding: const EdgeInsets.all(kDefaultPadding / 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 10),
                      blurRadius: 50,
                      color: kPrimaryColor.withOpacity(0.23),
                    ),
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title.toUpperCase(),
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            country.toUpperCase(),
                            style: TextStyle(
                              color: kPrimaryColor.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '\$$price',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: kPrimaryColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
