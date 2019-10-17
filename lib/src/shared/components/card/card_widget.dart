import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  CardWidget(this.title,this.img,this.color,this.width,this.height);
  final String img;
  final String title;
  final Color color;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30)
      ),
      padding: EdgeInsets.all(10),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(img,fit: BoxFit.contain,alignment: Alignment.bottomRight,),
          Positioned(top:10,left:10,child: Text(title,style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.w700),)),
        ],
      ),
    );
  }
}
