import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geeklib/src/shared/models/registerDto.dart';
import 'package:geeklib/src/shared/models/user.dart';
import 'package:geeklib/src/shared/repositories/user_repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class RegisterBloc extends BlocBase {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final _passwordController = BehaviorSubject();
  get password => _passwordController.value;
  get passwordSink => _passwordController.add;
  final _emailController = PublishSubject();
  get emailSink => _emailController.add;
  final _usernameController = PublishSubject();
  get usernameSink => _usernameController.add;
  final _confirmPasswordController = PublishSubject();
  get confirmPasswordSink => _confirmPasswordController.add;

  final _close$ = PublishSubject();

  Observable<UserModel> _currentUser;
  get currentUserStream => _currentUser;

  final repository = UserRepository();

  RegisterBloc() {
    _passwordController.listen(print);
    _currentUser = Observable.combineLatest([
      _emailController,
      _usernameController,
      _passwordController,
      _confirmPasswordController
    ], (values) => RegisterDto(values[0], values[1], values[2], values[3]))
        .asyncMap((e) => repository.register(e.email, e.username, e.password))
        .takeUntil(_close$)
        .asBroadcastStream();
  }

  @override
  void dispose() {
    _close$.close();
    _passwordController.close();
    _emailController.close();
    _usernameController.close();
    _confirmPasswordController.close();
    super.dispose();
  }
}
