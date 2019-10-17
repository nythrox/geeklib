import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class AppBloc extends BlocBase {
  final pageController = PageController(initialPage: 1);
  final TrackingScrollController scrollController = TrackingScrollController();

  void jumpToSearchPage() {
    if (pageController.page != 2) {
      // pageController.jumpToPage(2);
      pageController.animateToPage(2, duration: Duration(milliseconds: 500),curve: Curves.easeInOut);
      }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
