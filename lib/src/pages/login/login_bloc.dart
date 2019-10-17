import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginBloc extends BlocBase {

  PageController pageController = PageController(initialPage: 1);

  @override
  void dispose() {
    super.dispose();
  }
}
