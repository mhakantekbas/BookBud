import 'package:flutter/cupertino.dart';
import 'package:term_project/services/book_api.dart';
import '../model/book_model.dart';

class TodoProvider extends ChangeNotifier {
  final _service = new BookApi();
  bool isLoading = false;
  List<BookModel> _books = [];

  List<BookModel> get books => _books;

  Future<void> getAllBooks() async {
    isLoading = true;
    notifyListeners();

    final response = await BookApi.getBookData();
    _books = response;
    isLoading = false;
    notifyListeners();
  }
}
