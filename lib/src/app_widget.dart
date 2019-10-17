import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:geeklib/src/app_bloc.dart';
import 'package:geeklib/src/app_module.dart';
import 'package:geeklib/src/pages/explore/explore_page.dart';
import 'package:geeklib/src/pages/library/library_page.dart';
import 'package:geeklib/src/pages/login/login_page.dart';
import 'package:geeklib/src/pages/search/search_page.dart';
import 'package:geeklib/src/shared/blocs/auth_bloc.dart';
import 'package:geeklib/src/shared/models/user.dart';

import 'pages/cart/cart_page.dart';
import 'shared/components/SearchSliverAppbarDelegate/search_sliver_appbar_delegate_widget.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  AuthBloc authBloc = AppModule.to.bloc<AuthBloc>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Slidy',
        theme: ThemeData(
            inputDecorationTheme: InputDecorationTheme(
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffffcd33))),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffffcd33), width: 2)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffffcd33), width: 1.5)),
          errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffffcd33))),
          focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffffcd33), width: 2)),
        )),
        home: StreamBuilder<UserModel>(
            stream: authBloc.authUserStream,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                return HomeWidget();
              }
              return LoginPage();
            }));
    //HomeWidget()
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({
    Key key,
  }) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget>
    with SingleTickerProviderStateMixin {
  AuthBloc authBloc = AppModule.to.bloc<AuthBloc>();
  AnimationController animationController;
  Animation<double> scale;
  Animation<double> position;
  Animation<double> borderRadius;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    scale = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
        curve: Curves.fastOutSlowIn, parent: animationController));
    position = Tween<double>(begin: 0, end: 150).animate(CurvedAnimation(
        curve: Curves.fastOutSlowIn, parent: animationController));
    borderRadius = Tween<double>(begin: 0, end: 30).animate(CurvedAnimation(
        curve: Curves.fastOutSlowIn, parent: animationController));
    print("app_widget reloaded");
  }

  toggleMenu() {
    if (animationController.status == AnimationStatus.completed) {
      animationController.reverse();
    } else {
      animationController.forward();
    }
  }

  closeMenu() {
    animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    AppBloc bloc = AppModule.to.bloc<AppBloc>();

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: AnimatedBuilder(
          animation: animationController,
          builder: (context, snapshot) {
            return Stack(
              overflow: Overflow.visible,
              fit: StackFit.expand,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 100, horizontal: 30),
                      child: ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          ListTile(
                            onTap: () {},
                            title: StreamBuilder<UserModel>(
                                stream: authBloc.authUserStream,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(snapshot.data.username,
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500));
                                  }
                                  return CircularProgressIndicator();
                                }),
                          ),
                          ListTile(
                            onTap: () {
                              closeMenu();
                              bloc.pageController.animateToPage(0,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            },
                            title: Text("Profile",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w500)),
                          ),
                          ListTile(
                            onTap: () {
                              closeMenu();
                              bloc.pageController.animateToPage(1,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            },
                            title: Text("Explore",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w500)),
                          ),
                          ListTile(
                            onTap: () {
                              closeMenu();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (params) => CartPage()));
                            },
                            title: Text("Cart",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w500)),
                          ),
                          ListTile(
                            onTap: () {
                              closeMenu();
                              bloc.jumpToSearchPage();
                            },
                            title: Text("Search",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w500)),
                          ),
                          ListTile(
                            onTap: authBloc.logout,
                            title: Text("Logout",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w500)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Positioned(
                  left: position.value,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Transform.scale(
                    scale: scale.value,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(borderRadius.value),
                      child: Container(
                        color: Colors.white,
                        child: NestedScrollView(
                          headerSliverBuilder:
                              (BuildContext context, bool innerBoxIsScrolled) {
                            return <Widget>[
                              SliverPersistentHeader(
                                  pinned: true,
                                  delegate: SearchSliverAppbarDelegate(
                                      expandedHeight: 150, minHeight: 140)),
                            ];
                          },
                          body: PageView(
                            controller: bloc.pageController,
                            physics: NeverScrollableScrollPhysics(),
                            children: <Widget>[
                              LibraryPage(),
                              ExplorePage(),
                              SearchPage(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 30,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              toggleMenu();
                            },
                            icon: Icon(Icons.menu, size: 40),
                          ),
                          IconButton(
                            onPressed: () {
                              closeMenu();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (params) => CartPage()));
                            },
                            icon: Icon(Icons.shopping_basket, size: 40),
                          )
                        ],
                      ),
                    )),
              ],
            );
          }),
    );
  }
}
