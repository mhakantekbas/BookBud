// import 'package:term_project/model/book_model.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// import '../model/nytBookModel.dart';
// class NytBookApi {
//   static Future<List<NytBookModel>> fetchBooks() async {
//     List<NytBookModel> books = [];
//     const url = 'https://api.nytimes.com/svc/books/v3/lists/best-sellers/history.json?api-key=AwK9BIHdASvG6QxDFAjZ0iKGNh6yt5G2';
//     final uri = Uri.parse(url);
//     final response = await http.get(uri);
//     final body = response.body;
//     final json = jsonDecode(body);
//     final results = json['results']as List<dynamic>;
//     print('nyc api started');
//
//     if (books is List) {
//       books = results.map((e) => NytBookModel.fromMap(e)).toList();
//     } else {
//       return [];
//     }
//     print(books);
//     return books;
//   }
//   static Future<List<NytBookModel>> getBookstolist()async{
//    List<NytBookModel> books1 = fetchBooks() as List<NytBookModel>;
//    List<dynamic> books2 = [];
//    var url = 'https://www.googleapis.com/books/v1/volumes?q=flutter';
//    final uri = Uri.parse(url);
//    final body = response.body;
//    final json = jsonDecode(body);
//    final results = json['items'] as List<dynamic>;
//    final response = await http.get(uri);
//    for(int i =0;i<books1.length;i++){
//       String key = books1[i].title;
//      var url = 'https://www.googleapis.com/books/v1/volumes?q=$key&maxResults=1';
//      final uri = Uri.parse(url);
//      final response = await http.get(uri);
//      final body = response.body;
//      final json = jsonDecode(body);
//      final results = json['items'] as List<dynamic>;
//      books2.add(results);
//
//    }
//    if (books2 is List) {
//      books2 = results.map((e) => NytBookModel.fromMap(e)).toList();
//    } else {
//      return [];
//    }
//
//
//
//   }
// }