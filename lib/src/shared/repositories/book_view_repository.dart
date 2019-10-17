import 'package:dio/dio.dart';
import 'package:geeklib/src/shared/models/book_view.dart';

class BookViewRepository {
  final String newurl = "https://openlibrary.org";
  final dio = Dio();

  Future<BookViewModel> getBook(String key) async {
    try {
      Response res = await dio.get(newurl + key + ".json");
      return Future.value(BookViewModel.fromJson(res.data));
    } catch (e) {
      //why does it still load the info when returning a error?
      return Future.error(e);
    }
  }
}
