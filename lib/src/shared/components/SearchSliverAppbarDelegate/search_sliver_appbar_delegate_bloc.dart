import 'dart:ui' as dartui;
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

import '../../../app_bloc.dart';
import '../../../app_module.dart';

enum appbarStates {
  //todo make a better job using states instead of whateaver is now
  expanded,
  collapsed,
  transitioning
}

class SearchSliverAppbarDelegateBloc extends BlocBase {
  // final scrollController = ScrollController();
  ScrollController scrollController =
      AppModule.to.bloc<AppBloc>().scrollController;

  final double containerHeight =
      150; //the bigger this is, the bigger the distance between the navbar and the first movie
  final double backgroundHeight = 110; //height of the yellow background
  double searchbarHeight = 20;
  double titleHeight = 10;

  double offset = 0.0;

  final BehaviorSubject _topController = BehaviorSubject();

  final _searchbarTopPosition = BehaviorSubject<double>();
  get searchBarTopPositionStream => _searchbarTopPosition.stream;

  final _titleTopPosition = BehaviorSubject<double>();
  get titleTopPositionStream => _titleTopPosition.stream;

  final currentState =
      BehaviorSubject<appbarStates>.seeded(appbarStates.expanded);

  SearchSliverAppbarDelegateBloc() {
    scrollController.addListener(manageStates);
    currentState
        .distinct()
        .where((e) => e == appbarStates.expanded || e == appbarStates.collapsed)
        .listen((e) {
      // print("updating!!reason:" + e.toString());
      _titleTopPosition.add(_titleTop);
      _searchbarTopPosition.add(_searchBarTop);
    });
    currentState.where((e) => e == appbarStates.transitioning).listen((e) {
      // print("updating! because of transition  ");
      _titleTopPosition.add(_titleTop);
      _searchbarTopPosition.add(_searchBarTop);
    });
    //does the same thing but with more lines \/
    // currentState.listen((e) {
    //   //tldr will only update if in a transition state, or during distinct expanded/collapsed (scrolling) events
    //   // print("<e>");
    //   if (!(e == lastState)) {
    //     //if its a distinct state
    //     if (e == appbarStates.expanded || e == appbarStates.collapsed ) {

    //     print("updating!!reason:" + e.toString());
    //     _titleTopPosition.add(_titleTop);
    //     _searchbarTopPosition.add(_searchBarTop);
    //     }
    //   } else {
    //     if (e == appbarStates.transitioning &&
    //         lastState == appbarStates.transitioning) {
    //       //update only if the the state is repeated and the repeating state is "appbarStates.transitioning"
    //       print("updating! because of transition  ");
    //       _titleTopPosition.add(_titleTop);
    //       _searchbarTopPosition.add(_searchBarTop);
    //     }
    //   }

    //   lastState = currentState.value;
    //   // print("</e>");
    // });
  }

  void manageStates() {
    
    if (scrollController.hasClients) {
      if (offset == 0) {
        //expanded
        currentState.value = appbarStates.expanded;
      } else if (offset < containerHeight - backgroundHeight) {
        //transition
        currentState.value = appbarStates.transitioning;
      } else {
        //collapsed
        currentState.value = appbarStates.collapsed;
      }
    } else {
      //initial (expanded)
      currentState.value = appbarStates.expanded;
    }
  }

  get _titleTop {
    switch (currentState.value) {
      case appbarStates.expanded:
        {
          return (backgroundHeight / 2) - titleHeight;
        }
        break;
      case appbarStates.transitioning:
        {
          return dartui.lerpDouble((backgroundHeight / 2) - titleHeight, -20,
              (offset) / (containerHeight - backgroundHeight));
        }
        break;
      case appbarStates.collapsed:
        {
          return -20; //remove from screen
        }
        break;
    }
  }

  get _searchBarTop {
    switch (currentState.value) {
      case appbarStates.expanded:
        {
          return backgroundHeight - searchbarHeight;
        }
        break;
      case appbarStates.collapsed:
        {
          return (backgroundHeight / 2) - searchbarHeight; //center it
        }
        break;
      case appbarStates.transitioning:
        {
          return dartui.lerpDouble(
              backgroundHeight - searchbarHeight,
              (backgroundHeight / 2) - searchbarHeight,
              (offset) / (containerHeight - backgroundHeight));
        }

        break;
    }
  }

  //doesnt need to have streams etc, because since the widget that calls this is already inside a different stream provider, when it needs to update it will update
  double searchbarWidth(context) {
    double smallSize = 0.75;
    double width = MediaQuery.of(context).size.width;
    if (scrollController.hasClients) {
      if (offset < (containerHeight - backgroundHeight)) {
        //transition perioid from normal to big / big to normal (when offset is from 0 to bloc.containerHeight(big) - toolbarHeight (small)))
        width = dartui.lerpDouble(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.width * smallSize,
            (offset) /
                (containerHeight -
                    backgroundHeight)); //make margin top equals to bloc.containerHeight minus offset
      } else {
        width = width * smallSize;
      }
    }
    return width;
  }

  @override
  void dispose() {
    _topController.close();
    _titleTopPosition.close();
    _searchbarTopPosition.close();
    currentState.close();
    scrollController.dispose();
    super.dispose();
  }
}
