import 'package:flutter/material.dart';
import 'package:geeklib/src/pages/login/components/register_widget/register_bloc.dart';
import 'package:geeklib/src/shared/blocs/auth_bloc.dart';

import '../../../../app_module.dart';

class Register extends StatefulWidget {
  const Register({
    Key key,
  }) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  RegisterBloc bloc = AppModule.to.bloc<RegisterBloc>();
  AuthBloc authBloc = AppModule.to.bloc<AuthBloc>();

@override
  void initState() {
    super.initState();
    bloc.currentUserStream.listen(authBloc.login,
        onError: (e) => showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Error"),
                content: Text(
                    e.toString()),
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
    AppModule.to.disposeBloc<RegisterBloc>();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
                    "Username",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xffffcd33),
                      fontSize: 15.0,
                    ),
                  ),
                  TextFormField(
                    onSaved: bloc.usernameSink,
                    validator: (username) {
                      if (username.length > 2) {
                        return null;
                      }
                      return "Username must have at least 3 characters.";
                    },
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: 'nythrox',
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
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
                    obscureText: true,
                    onSaved: bloc.passwordSink,
                    onChanged: bloc.passwordSink,
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
                  SizedBox(height: 30),
                  Text(
                    "CONFIRM PASSWORD",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xffffcd33),
                      fontSize: 15.0,
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    onSaved: bloc.confirmPasswordSink,
                    validator: (confirmPassword) {
                      if (confirmPassword == bloc.password) {
                        return null;
                      }
                      return "Both passwords must be equal";
                    },
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: '*********',
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
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
                              child: Text("REGISTER",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)))
                        ]))),
            Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
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
      ),
    );
  }
}
