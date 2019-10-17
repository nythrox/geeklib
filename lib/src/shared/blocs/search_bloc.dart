import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:geeklib/src/app_module.dart';
import 'package:geeklib/src/shared/models/query.dart';
import 'package:geeklib/src/shared/repositories/query_repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class SearchBloc extends BlocBase {
  final QueryRepository repository =
      AppModule.to.getDependency<QueryRepository>();

  final _query = BehaviorSubject<String>();
  void queryEvent(String i) => _query.add(i);

  BehaviorSubject<List<Doc>> result;
  BehaviorSubject<String> get query => _query;
  BehaviorSubject<SearchViewModel> searchViewModel;

  SearchBloc() {
    result = _query
         .where((e) => e.isNotEmpty)
        .debounceTime(Duration(milliseconds: 250))
        .switchMap((e) =>
            Observable.fromFuture(repository.searchBook(e)).startWith(null)).shareValue()
          ;

    searchViewModel = Observable.combineLatest2(query.startWith(''), result.startWith(null),
        (query, result) => SearchViewModel(query, result))
        .asBroadcastStream().shareValue();
  }

  @override
  void dispose() {
    _query.close();
    searchViewModel.close();
    result.close();
    super.dispose();
  }
}

class SearchViewModel {
  final String query;
  final List<Doc> results;

  SearchViewModel(this.query, this.results);
}
