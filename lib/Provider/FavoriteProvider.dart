import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

import 'package:term_project/model/book_model.dart';

class FavoriteProvider extends ChangeNotifier {
  List<BookModel> _favbook = [];
  List<BookModel> get favbook => _favbook;

  bool isExist(BookModel book) {
    final isExist = _favbook.contains(book);
    return isExist;
  }

  void clearFavorite() {
    _favbook = [];
    notifyListeners();
  }

  void addList(BookModel book) {
    _favbook.add(book);

    notifyListeners();
  }

  void removeList(BookModel book) {
    _favbook.remove(book);

    notifyListeners();
  }
}
