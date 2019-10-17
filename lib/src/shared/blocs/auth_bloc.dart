import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:geeklib/src/shared/models/user.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc extends BlocBase {


  final _authUser = BehaviorSubject<UserModel>();
  get authUserStream => _authUser.stream;


  login(UserModel user){
    _authUser.add(user);
  }
  logout(){
    _authUser.add(null);
  }


  @override
  void dispose() {
    _authUser.close();
    super.dispose();
  }
}

