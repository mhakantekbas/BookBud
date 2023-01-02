import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:term_project/model/book_model.dart';

class BookApi {
  static Future<List<BookModel>> fetchBooks() async {
    List<BookModel> books = [];
    const url = 'https://www.googleapis.com/books/v1/volumes?q=flutter';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['items'] as List<dynamic>;
    print('api started');

    if (books is List) {
      books = results.map((e) => BookModel.fromMap(e)).toList();
    } else {
      return [];
    }
    return books;
  }

  static Future<List<BookModel>> getBookDetail(String queryUrl) async {
    List<BookModel> books = [];
    var url = queryUrl;
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['items'] as List<dynamic>;
    print('api started');

    if (books is List) {
      books = results.map((e) => BookModel.fromMap(e)).toList();
    } else {
      return [];
    }
    return books;
  }
}
