import 'package:flutter/material.dart';
import 'package:geeklib/src/app_module.dart';
import 'package:geeklib/src/shared/blocs/auth_bloc.dart';

import 'login_widget_bloc.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({
    Key key,
  }) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  LoginWidgetBloc bloc = AppModule.to.bloc<LoginWidgetBloc>();
  AuthBloc authBloc = AppModule.to.bloc<AuthBloc>();

  @override
  void initState() {
    super.initState();
    bloc.currentUserStream.listen(authBloc.login,
        onError: (e) => showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Account not found"),
                content: Text(
                    "No account with your username or password was found."),
                actions: <Widget>[
                  FlatButton(
                    child: Text("OK"),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              );
            }));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.99),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(height: 20),
          Image.asset(
            "assets/images/libgeek_icon.png",
            width: 100,
          ),
          // Center(child: Icon(Icons.library_books, size: 50, color: Color(0xffffcd33))),
          Form(
            key: bloc.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 30),
                Text(
                  "EMAIL",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xffffcd33),
                    fontSize: 15.0,
                  ),
                ),
                TextFormField(
                  onSaved: bloc.emailSink,
                  validator: (email) {
                    if (email.contains("@") && email.contains(".")) {
                      return null;
                    }
                    return "Please enter a valid email.";
                  },
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: "jaoalves@gmail.com.br",
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
                SizedBox(height: 30),
                Text(
                  "PASSWORD",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xffffcd33),
                    fontSize: 15.0,
                  ),
                ),
                TextFormField(
                  onSaved: bloc.passwordSink,
                  obscureText: true,
                  validator: (password) {
                    if (password.length <= 7) {
                      return "Passwords must have at least 8 characters of length.";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: '*********',
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
              ],
            ),
          ),

          FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: Color(0xffffcd33),
              onPressed: () {
                if (bloc.formKey.currentState.validate()) {
                  bloc.formKey.currentState.save();
                }
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
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)))
                      ]))),
          Column(
            children: <Widget>[
              Center(
                child: Text(
                  "OR CONNECT WITH",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: Color(0xff3a569c),
                      onPressed: () => {},
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 12.0,
                          ),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Icon(
                                  Icons.face,
                                  color: Colors.white,
                                ),
                              ),
                              Text("FACEBOOK",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ))),
                  FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: Color(0xffd23e44),
                      onPressed: () => {},
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 12.0,
                          ),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Icon(
                                  Icons.face,
                                  color: Colors.white,
                                ),
                              ),
                              Text("GOOGLE",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ))),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
