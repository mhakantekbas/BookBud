import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:term_project/model/book_model.dart';

class BookStreamPublisher {
  String userid = FirebaseAuth.instance.currentUser!.uid;
  final _database = FirebaseDatabase.instance.ref();
  Stream<List<BookModel>> getOrderStream() {
    final bookStream = _database.child(userid).child("likedbooks").onValue;
    final streamToPublish = bookStream.map((event) {
      final bookMap = Map<String, dynamic>.from(
          event.snapshot.value as Map<String, dynamic>);
      final bookList = bookMap.entries.map((element) {
        return BookModel.fromRTDB(Map<String, dynamic>.from(element.value));
      }).toList();
      return bookList;
    });
    return streamToPublish;
  }
}
