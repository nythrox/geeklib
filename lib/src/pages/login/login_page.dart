import 'package:flutter/material.dart';
import 'package:geeklib/src/app_module.dart';
import 'package:geeklib/src/pages/login/components/loginWidget/login_widget.dart';
import 'package:geeklib/src/pages/login/login_bloc.dart';

import 'components/register_widget/register_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc bloc = AppModule.to.bloc<LoginBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/login_background.png"),
                fit: BoxFit.fitHeight)),
        child: PageView(
          controller: bloc.pageController,
          children: <Widget>[
            Register(),
            LoginHome(),
            LoginWidget(),
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    AppModule.to.disposeBloc<LoginBloc>();
    super.dispose();
  }
}

class LoginHome extends StatefulWidget {
  const LoginHome({
    Key key,
  }) : super(key: key);

  @override
  _LoginHomeState createState() => _LoginHomeState();
}

class _LoginHomeState extends State<LoginHome> {
  LoginBloc bloc = AppModule.to.bloc<LoginBloc>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow.withOpacity(0.9),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              Image.asset("assets/images/libgeek_icon.png", width: 100),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Geek",
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  Text("Lib",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                      )),
                ],
              ),
            ],
          ),
          Column(
            children: <Widget>[
              OutlineButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  borderSide: BorderSide(color: Colors.white, width: 2),
                  highlightedBorderColor: Colors.white,
                  highlightColor: Colors.yellow,
                  color: Colors.transparent,
                  onPressed: () {
                    bloc.pageController.animateToPage(0,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut);
                  },
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                                child: Text("SIGN UP",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))),
                          ]))),
              SizedBox(height: 30),
              FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Colors.white,
                  onPressed: () {
                    bloc.pageController.animateToPage(2,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut);
                  },
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                                child: Text("LOGIN",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xffffcd33),
                                        fontWeight: FontWeight.bold)))
                          ]))),
            ],
          ),
        ],
      ),
    );
  }
}

