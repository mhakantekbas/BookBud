import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:term_project/model/book_model.dart';

class BookApi {
  static Future<List<BookModel>> fetchBooks() async {
    const url = 'https://www.googleapis.com/books/v1/volumes?q=flutter';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['items'] as List<dynamic>;
    print('api started');
    return results.map((e) => BookModel.fromMap(e)).toList();
  }
}
