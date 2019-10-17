import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:geeklib/src/app_module.dart';
import 'package:geeklib/src/shared/repositories/book_view_repository.dart';
import 'package:rxdart/rxdart.dart';

class BookViewBloc extends BlocBase {
  //dispose will be called automatically by closing its streams

  final BookViewRepository _repository =
      AppModule.to.getDependency<BookViewRepository>();
  final _bookKey = BehaviorSubject<String>();
  get addBookKey => _bookKey.add;
  final _book = BehaviorSubject<dynamic>();
  get bookStream => _book.stream
      .switchMap((key) => Observable.fromFuture(_repository.getBook(key)));

  BookViewBloc() {
    _bookKey.listen((key) {
      _book.add(key);
    });
  }

  // _getBook(String key) async {
  //   BookViewModel book = await ;
  //   _book.add(book);
  // }

  @override
  void dispose() {
    _bookKey.close();
    _book.close();
    super.dispose();
  }
}
