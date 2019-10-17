import 'dart:math';
import 'package:flutter/material.dart';
import 'package:geeklib/src/app_module.dart';

import '../../../app_bloc.dart';

class TabBarSliverAppbarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double minHeight;
  final TabController tabController;

  TabBarSliverAppbarDelegate(this.tabController,{this.expandedHeight, this.minHeight});

  @override
  double get maxExtent => expandedHeight == null
      ? max((expandedHeight ?? kToolbarHeight), minExtent)
      : expandedHeight;

  @override
  double get minExtent => minHeight == null ? kToolbarHeight : minHeight;

  // TabBarSliverAppbarDelegateBloc sliverBloc =
  //     AppModule.to.bloc<TabBarSliverAppbarDelegateBloc>();

  
  AppBloc appPageBloc = AppModule.to.bloc<AppBloc>();
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: TabBar(
                  controller: tabController,
                  tabs: <Widget>[
                    Tab(
                      child: Text(
                        "Library",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Favorites",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Read",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
