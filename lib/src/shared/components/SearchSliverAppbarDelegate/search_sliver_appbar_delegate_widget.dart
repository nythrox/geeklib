import 'dart:math';
import 'package:flutter/material.dart';
import 'package:geeklib/src/app_module.dart';
import 'package:geeklib/src/shared/blocs/search_bloc.dart';
import 'package:geeklib/src/shared/components/SearchSliverAppbarDelegate/search_sliver_appbar_delegate_bloc.dart';

import '../../../app_bloc.dart';

class SearchSliverAppbarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double minHeight;

  SearchSliverAppbarDelegate({this.expandedHeight, this.minHeight});

  @override
  double get maxExtent => expandedHeight == null
      ? max((expandedHeight ?? kToolbarHeight), minExtent)
      : expandedHeight;

  @override
  double get minExtent => minHeight == null ? kToolbarHeight : minHeight;

  SearchSliverAppbarDelegateBloc sliverBloc =
      AppModule.to.bloc<SearchSliverAppbarDelegateBloc>();

  SearchBloc searchBloc = AppModule.to.bloc<SearchBloc>();

  AppBloc appPageBloc = AppModule.to.bloc<AppBloc>();
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
              height: sliverBloc.backgroundHeight,
              decoration: BoxDecoration(color: Colors.yellow, boxShadow: [
                BoxShadow(
                    offset: Offset(0, 10),
                    color: Color.fromRGBO(128, 128, 128, 0.2),
                    blurRadius: 10)
              ])),
          StreamBuilder<double>(
              initialData: 80,
              stream: sliverBloc.titleTopPositionStream,
              builder: (context, snapshot) {
                return Positioned(
                    top: snapshot.data,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text(
                        "LibGeek",
                        style: TextStyle(fontSize: 22),
                      ),
                    ));
              }),
          StreamBuilder<double>(
              stream: sliverBloc.searchBarTopPositionStream,
              builder: (context, snapshot) {
                return Positioned(
                    top: snapshot.data,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: sliverBloc.searchbarWidth(context) - 40,
                          margin: EdgeInsets.only(right: 20, left: 20),
                          // padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 10),
                                    color: Color.fromRGBO(128, 128, 128, 0.2),
                                    blurRadius: 10)
                              ]),
                          child: TextField(
                            onTap: () {
                              appPageBloc.jumpToSearchPage();
                            },
                            onSubmitted: (title) {
                              appPageBloc.jumpToSearchPage();
                              searchBloc.queryEvent(title);
                            },
                            onChanged: (title) {
                              appPageBloc.jumpToSearchPage();
                              searchBloc.queryEvent(title);
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 15),
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              suffixIcon: Icon(Icons.search),
                              hintText: 'Search...',
                            ),
                          ),
                        ),
                      ],
                    ));
              })
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
