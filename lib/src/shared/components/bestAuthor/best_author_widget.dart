import 'package:flutter/material.dart';

class BestAuthorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:10.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
              child: Image.network(
                  "https://hips.hearstapps.com/digitalspyuk.cdnds.net/17/15/1492008991-gettyimages-511965976.jpg?crop=0.503xw:0.558xh;0.230xw,0.128xh&resize=480:*",
                  width: 50)),
          Padding(
            padding: const EdgeInsets.only(left:18.0),
            child: Text("George RR Martin",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          )
        ],
      ),
    );
  }
}
