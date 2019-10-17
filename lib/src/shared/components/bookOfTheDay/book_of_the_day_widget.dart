import 'package:flutter/material.dart';

class BookOfTheDayWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.network(
            "https://img0-placeit-net.s3-accelerate.amazonaws.com/uploads/stage/stage_image/37836/large_thumb_stage.jpg",
            width: 130,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0,top: 20,bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("The Black Kiss",style: TextStyle(fontSize: 25),),
                Padding(
                  padding: const EdgeInsets.only(top:5.0),
                  child: Text("Black D. King",style: TextStyle(fontSize: 20,color: Colors.black38)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:6,bottom: 10),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        color: Color.fromRGBO(230, 230, 230, 1.0),
                        child: Text(
                          "Journey",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        color: Color.fromRGBO(230, 230, 230, 1.0),
                        child: Text(
                          "Journey",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top:20.0,bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.yellow, shape: BoxShape.circle),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.bookmark, color: Colors.black),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left:10.0),
                          child: RaisedButton(
                            padding: EdgeInsets.symmetric(horizontal: 40,vertical: 12),
                            color: Colors.black,
                            onPressed: () {
                              print("tapped");
                            },
                            elevation: 0,
                            splashColor: Colors.yellow,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                            child: Text(
                              "Buy Now",
                              style: TextStyle(color: Colors.white,fontSize: 16),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
