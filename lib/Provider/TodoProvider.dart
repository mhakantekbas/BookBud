import 'package:flutter/cupertino.dart';
import 'package:term_project/services/book_api.dart';
import '../model/book_model.dart';
import '../services/dummydata.dart';

class TodoProvider with ChangeNotifier {
  late BookModel book;


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
  void BookSelector(BookModel bookFromApi){
    this.book = bookFromApi;
    notifyListeners();
  }

}
