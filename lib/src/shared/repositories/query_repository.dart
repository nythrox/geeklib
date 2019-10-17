import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:geeklib/src/shared/models/query.dart';

class QueryRepository {
  final String url = "http://openlibrary.org/search.json?";
  final Dio dio = Dio();

  Future<List<Doc>> searchBook(String title) async {
    print(title);

    List<Doc> bookList = [];
    try {
      Response res = await dio.get(url, queryParameters: {"q": title,"mode":"ebooks","has_fulltext":true});
      print(((jsonDecode(res.data))["docs"]).map((e) {
        bookList.add(Doc.fromJson(e));
      }));
    return Future.value(bookList);
    } catch (e) {
      print(e);
      return Future.error(e);
    }
  }
}
