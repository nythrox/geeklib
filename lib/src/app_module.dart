import 'package:geeklib/src/pages/login/components/loginWidget/login_widget_bloc.dart';
import 'package:geeklib/src/pages/login/components/register_widget/register_bloc.dart';
import 'package:geeklib/src/pages/login/login_bloc.dart';
import 'package:geeklib/src/shared/blocs/auth_bloc.dart';
import 'package:geeklib/src/shared/components/bookOfTheDay/book_of_the_day_bloc.dart';
import 'package:geeklib/src/pages/cart/cart_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:geeklib/src/app_widget.dart';
import 'package:geeklib/src/app_bloc.dart';
import 'package:geeklib/src/shared/components/SearchSliverAppbarDelegate/search_sliver_appbar_delegate_bloc.dart';
import 'package:geeklib/src/shared/blocs/search_bloc.dart';
import 'package:geeklib/src/shared/repositories/book_view_repository.dart';
import 'package:geeklib/src/shared/repositories/query_repository.dart';

class AppModule extends ModuleWidget {
  @override

  //these blocs and their streams are only instanciated when they are called the first time
  //they are disposed when called AppModule.to.disposeBloc<BlocName>();
  List<Bloc> get blocs => [
        Bloc((i) => LoginWidgetBloc()),
        Bloc((i) => RegisterBloc()),
        Bloc((i) => LoginBloc()),
        Bloc((i) => BookOfTheDayBloc()),
        Bloc((i) => CartBloc()),
        Bloc((i) => SearchSliverAppbarDelegateBloc()),
        Bloc((i) => SearchBloc()),
        Bloc((i) => AuthBloc()),
        Bloc((i) => AppBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => QueryRepository()),
        Dependency((i) => BookViewRepository()),
      ];

  @override
  Widget get view => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
