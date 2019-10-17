import 'package:flutter/material.dart';

class HeaderCardWidget extends StatelessWidget {
  HeaderCardWidget(this.title,this.img,this.color,this.height);
  final String img;
  final String title;
  final Color color;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: height,
      decoration: BoxDecoration(
        color: color,
      ),
      padding: EdgeInsets.all(10),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(img,fit: BoxFit.contain,alignment: Alignment.bottomRight,),
          Positioned(top:20,left:20,child: Text(title,style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.w700),)),
        ],
      ),
    );
  }
}
