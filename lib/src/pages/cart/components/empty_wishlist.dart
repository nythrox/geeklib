import 'package:flutter/material.dart';

class EmptyWishlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "It seems like you ran out of books to read! Try explore to find more!",
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: RotatedBox(
                    quarterTurns: 1,
                    child: Text(
                      " : (",
                      style: TextStyle(fontSize: 50),
                      textAlign: TextAlign.center,
                    )),
              )
            ],
          )),
    );
  }
}
