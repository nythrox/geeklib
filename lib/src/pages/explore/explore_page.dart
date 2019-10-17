
import 'package:flutter/material.dart';
import 'package:geeklib/src/shared/components/bestAuthor/best_author_widget.dart';
import 'package:geeklib/src/shared/components/bookCoverHorizontalList/book_cover_horizontal_list_widget.dart';
import 'package:geeklib/src/shared/components/bookOfTheDay/book_of_the_day_widget.dart';


class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                top: 30, bottom: 0, right: 30, left: 30),
            child: Text(
              "Book of the day",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 30, left: 30),
            child: BookOfTheDayWidget(),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 30, left: 30),
            child: Text(
              "Best Author",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          
        Container(
          padding: const EdgeInsets.only(bottom: 10, right: 30, left: 30),
          child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, i) {
              return Divider(
                color: Colors.black,
              );
            },
            itemCount: 3,
            itemBuilder: (context, i) {
              return BestAuthorWidget();
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10, right: 30, left: 30),
          child: Text(
            "Top Adventures",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BookCoverHorizontalListWidget(MediaQuery.of(context).size.width / 4),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BookCoverHorizontalListWidget(MediaQuery.of(context).size.width / 4),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BookCoverHorizontalListWidget(MediaQuery.of(context).size.width / 4),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BookCoverHorizontalListWidget(MediaQuery.of(context).size.width / 4),
                ),
              ),
            ],
          ),
        ),
        ],
      );
  }
}
