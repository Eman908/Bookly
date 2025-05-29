import 'package:bookly/features/home/data/models/books_model/books_model.dart';
import 'package:dio/dio.dart';

class ApiServices {
  final _baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio _dio = Dio();
  Future<List<BooksModel>> get({required String endPoint}) async {
    Response response = await _dio.get('$_baseUrl$endPoint');
    List<BooksModel> booksList = [];
    for (var item in response.data['items']) {
      booksList.add(BooksModel.fromJson(item));
    }
    return booksList;
  }
}
