import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

import 'package:term_project/model/book_model.dart';

class FavoriteProvider extends ChangeNotifier {
  List<BookModel> _favbook = [];
  List<BookModel> get favbook => _favbook;
  DatabaseReference reference = FirebaseDatabase.instance
      .ref()
      .child(FirebaseAuth.instance.currentUser!.uid)
      .child('likedbooks/');

  bool isExist(BookModel book) {
    final isExist = _favbook.contains(book);
    return isExist;
  }

  void clearFavorite() {
    _favbook = [];
    notifyListeners();
  }

  void addList(BookModel book) {
    var books = <String, dynamic>{
      "title": book.title,
      "author": book.author,
      "url": book.thumbnailUrl,
    };

    _favbook.add(book);
    book.taskid = reference.push().key!;
    reference.child(book.taskid!).set(books);

    notifyListeners();
  }

  void removeList(BookModel book) {
    _favbook.remove(book);
    reference.child(book.taskid!).remove();

    notifyListeners();
  }
}
