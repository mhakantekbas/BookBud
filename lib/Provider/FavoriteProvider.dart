import 'package:flutter/cupertino.dart';
import 'package:term_project/model/book_model.dart';

import '../services/dummydata.dart';

class FavoriteProvider extends ChangeNotifier {
  List<BookModel> _favbook = [];
  List<BookModel> get favbook => _favbook;

  void toggleFavorite(BookModel book) {
    final isExist = _favbook.contains(book);
    if (isExist) {
      _favbook.remove(book);
    } else {
      _favbook.add(book);
    }
    notifyListeners();
  }

  bool isExist(BookModel book) {
    final isExist = _favbook.contains(book);
    return isExist;
  }

  void clearFavorite() {
    _favbook = [];
    notifyListeners();
  }
}
