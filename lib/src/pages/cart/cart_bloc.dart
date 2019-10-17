import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:geeklib/src/shared/models/query.dart';
import 'package:rxdart/subjects.dart';

class CartBloc extends BlocBase {
  //dispose will be called automatically by closing its streams

  List<Doc> _cartBooks = [
    Doc(title: "smh lmao", coverI: 8220104),
    Doc(title: "smh lmao", coverI: 8220104),
    Doc(title: "smh lmao", coverI: 8220104),
    Doc(title: "smh lmao", coverI: 8220104),
    Doc(title: "smh lmao", coverI: 8220104),
    Doc(title: "smh lmao", coverI: 8220104),
    Doc(title: "smh lmao", coverI: 8220104),
    Doc(title: "smh lmao", coverI: 8220104)
  ];
  
  final _lastDeletedItem = BehaviorSubject<Doc>();
  get lastDeletedItem => _lastDeletedItem.value;
  get addLastDeletedItem => _lastDeletedItem.add;

  final _cartList = BehaviorSubject<List<Doc>>();
  get cartListStream => _cartList.stream;

  CartBloc() {
    _cartList.add(_cartBooks);
  }

  removeItem(int i) {
    _cartBooks.removeAt(i);
    _cartList.add(_cartBooks);
  }

  addItem(object, int i) {
    _cartBooks.insert(i, object);
    _cartList.add(_cartBooks);
  }

  @override
  void dispose() {
    _lastDeletedItem.close();
    _cartList.close();
    super.dispose();
  }
}
