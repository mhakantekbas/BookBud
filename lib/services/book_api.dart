import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:term_project/model/book_model.dart';

class BookApi {
  static const String _url =
      'https://www.googleapis.com/books/v1/volumes?q=subject:thriller&download=epub&orderBy=newest&key=AIzaSyAqxw3nnCxwNQXRmXb-ZFi8FTNyhz6kwGA';

  static Future<List<BookModel>> getBookData() async {
    List<BookModel> list = [];

    var result = await Dio().get(_url);
    var bookList = jsonDecode(result.data);

    if (bookList is List) {
      list = bookList.map((e) => BookModel.fromJson(e)).toList();
    } else {
      return [];
    }

    return list;
  }
}
