import 'package:flutter/material.dart';

class BookCoverHorizontalListWidget extends StatelessWidget {
  final double width;
  BookCoverHorizontalListWidget(this.width);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Image.network(
          "https://images-na.ssl-images-amazon.com/images/I/71rNJQ2g-EL._SY606_.jpg",
            // fit: BoxFit.none,
          width: width,
          ),
      ),
    );
  }
}
