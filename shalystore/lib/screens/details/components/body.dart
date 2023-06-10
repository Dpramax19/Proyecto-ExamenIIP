import 'package:flutter/material.dart';
import 'package:shalystore/constants.dart';

import 'image_and_icons.dart';
import 'title_and_price.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Description'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Style Gam\n'),
                Text('USA'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showBuyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Buys'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Confirm purchase\n'),
                Text('Do you want to add this item to the shopping cart?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Add to cart'),
              onPressed: () {
                Navigator.of(context).pop();
                _showConfirmationDialog(context);
              },
            ),
            TextButton(
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Purchase Confirmation'),
          content: const Text('Item added to shopping cart!'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        // Envuelve el contenido en un SingleChildScrollView
        child: Column(
          children: <Widget>[
            ImageAndIcons(size: size),
            const TitleAndPrice(title: "Style Gam", country: "USA", price: 220),
            const SizedBox(height: kDefaultPadding),
            Row(
              children: <Widget>[
                SizedBox(
                  width: size.width / 2,
                  height: 84,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                        ),
                      ),
                      backgroundColor: kPrimaryColor,
                    ),
                    onPressed: () {
                      _showBuyDialog(context);
                    },
                    child: const Text(
                      "Buy Now",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      _showMyDialog(context);
                    },
                    child: const Text("Description"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
