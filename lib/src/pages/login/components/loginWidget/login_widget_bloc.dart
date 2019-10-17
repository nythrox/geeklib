import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geeklib/src/shared/models/loginDto.dart';
import 'package:geeklib/src/shared/models/user.dart';
import 'package:geeklib/src/shared/repositories/user_repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class LoginWidgetBloc extends BlocBase {
  
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final _passwordController = PublishSubject();
  get passwordSink => _passwordController.add;
  final _emailController = PublishSubject();
  get emailSink => _emailController.add;
  
  final _close$ = PublishSubject();

  Observable<UserModel> _currentUser;
  get currentUserStream => _currentUser;

  final repository = UserRepository();

  LoginWidgetBloc() {
    _currentUser = _emailController
        .zipWith(_passwordController, (e, p) => LoginDto(e, p))
        .asyncMap((e) => repository.login(e.email, e.password))
        .takeUntil(_close$)
        .asBroadcastStream();
  }

  @override
  void dispose() {
    _close$.close();
    _passwordController.close();
    _emailController.close();
    super.dispose();
  }
}
