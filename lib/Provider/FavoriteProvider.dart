import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:googleapis/apigeeregistry/v1.dart';
import 'package:term_project/model/book_model.dart';

import '../services/dummydata.dart';

class FavoriteProvider extends ChangeNotifier {
  List<BookModel> _favbook = [];
  List<BookModel> get favbook => _favbook;

  late DatabaseReference reference = FirebaseDatabase.instance
      .ref()
      .child(FirebaseAuth.instance.currentUser!.displayName!)
      .child('likedbooks/');

  void toggleFavorite(BookModel book) {
    var books = <String, dynamic>{
      "title": book.title,
      "author": book.author,
      "url": book.thumbnailUrl,
    };
    final isExist = _favbook.contains(book);
    if (isExist) {
      _favbook.remove(book);

      reference.remove();
    } else {
      _favbook.add(book);
      reference.push().set(books);
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
