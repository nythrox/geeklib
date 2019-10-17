import 'package:flutter/material.dart';

class CartMenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                backgroundColor: Colors.yellow,
                forceElevated: false,
                elevation: 0,
                expandedHeight: 90,
                flexibleSpace: Container(
                  padding: EdgeInsets.only(top: 10),
                  height: MediaQuery.of(context).size.height,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios),
                      ),
                      Text("Cart",style: TextStyle(fontSize: 23),),
                      SizedBox(
                        width: 40,
                        height: 10,
                      )
                    ],
                  ),
                ),
              );
  }
}
