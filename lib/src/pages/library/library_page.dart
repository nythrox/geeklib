import 'package:flutter/material.dart';
import 'package:geeklib/src/shared/components/MovieTile/movie_tile_widget.dart';
import 'package:geeklib/src/shared/components/TabBarSliverAppbarDelegate/tab_bar_sliver_appbar_delegate_widget.dart';
import 'package:geeklib/src/shared/components/card/card_widget.dart';
import 'package:geeklib/src/shared/components/headerCard/card_widget.dart';
import 'package:geeklib/src/shared/models/query.dart';

class LibraryPage extends StatefulWidget {
  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage>
    with SingleTickerProviderStateMixin {
  TabController tabsController;
  @override
  void initState() {
    super.initState();
    tabsController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, iForgot) {
        return [
          SliverPersistentHeader(
            pinned: true,
            delegate: TabBarSliverAppbarDelegate(tabsController,
                expandedHeight: 48, minHeight: 38),
          )
        ];
      },
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tabsController,
        children: <Widget>[
          ListView(
            padding: EdgeInsets.all(0),
            children: <Widget>[
              HeaderCardWidget("My \nBooks", "assets/images/new_york.png",
                  Colors.greenAccent, 150),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: MovieTileWidget(
                          Doc(title: "smh lmao", coverI: 8220104)),
                    ),
                    Divider(color: Colors.black54),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: MovieTileWidget(
                          Doc(title: "smh lmao", coverI: 8220104)),
                    ),
                    Divider(color: Colors.black54),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: MovieTileWidget(
                          Doc(title: "smh lmao", coverI: 8220104)),
                    ),
                    Divider(color: Colors.black54),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: MovieTileWidget(
                          Doc(title: "smh lmao", coverI: 8220104)),
                    ),
                    Divider(color: Colors.black54),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: MovieTileWidget(
                          Doc(title: "smh lmao", coverI: 8220104)),
                    ),
                    Divider(color: Colors.black54),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: MovieTileWidget(
                          Doc(title: "smh lmao", coverI: 8220104)),
                    ),
                  ],
                ),
              ),
              Container(
                height: 250,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  separatorBuilder: (context, i) {
                    return SizedBox(width: 10, height: 20);
                  },
                  itemBuilder: (context, i) {
                    if (i == 0) {
                      return Column(
                        children: <Widget>[
                          CardWidget(
                              "Best \nAuthor",
                              "assets/images/new_york.png",
                              Color.fromRGBO(100, 200, 50, 1),
                              250,
                              250),
                        ],
                      );
                    } else {
                      return Column(
                        children: <Widget>[
                          CardWidget(
                              "Best \nAuthor",
                              "assets/images/new_york.png",
                              Color.fromRGBO(100, 200, 100 * (i), 1),
                              250,
                              250),
                        ],
                      );
                    }
                  },
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[],
          ),
          Column(
            children: <Widget>[],
          )
        ],
      ),
    );
  }
}
