import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BuyNowButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
                padding: EdgeInsets.symmetric(horizontal: 10),
                color: Colors.black,
                onPressed: () {
                  print("tapped");
                },
                elevation: 0,
                splashColor: Colors.yellow,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 25,
                      height: 10,
                    ),
                    Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                        child: Text(
                          "Buy Now",
                          style: TextStyle(color: Colors.white),
                        )),
                    Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Icon(
                          Icons.shopping_basket,
                        ))
                  ],
                ),
              );
  }
}