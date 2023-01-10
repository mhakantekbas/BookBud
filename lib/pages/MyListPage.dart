import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/calendar/v3.dart';

import 'package:provider/provider.dart';
import 'package:term_project/model/book_model.dart';

import '../Provider/FavoriteProvider.dart';
import '../services/dummydata.dart';
import 'BookDetailPage.dart';

class MyListPage extends StatefulWidget {
  const MyListPage({Key? key}) : super(key: key);

  @override
  State<MyListPage> createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
  String _displayText = "deneme";
  String userid = FirebaseAuth.instance.currentUser!.uid;
  late DatabaseReference reference =
      FirebaseDatabase.instance.ref().child(userid).child('likedbooks/');
  final _database = FirebaseDatabase.instance.ref();
  late StreamSubscription _bookStream;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _activateListeners();
  }

  void _performSingleFetch() {
    _database.child(userid).child("likedbooks/").get().then((snapshot) {
      final data =
          Map<String, dynamic>.from(snapshot.value as Map<dynamic, dynamic>);
      final likedbook = BookModel.fromRTDB(data);
      setState(() {
        _displayText = likedbook.author!;
      });
    });
  }

  void _activateListeners() {
    _bookStream =
        _database.child(userid).child("likedbooks/").onValue.listen((event) {
      var data = Map<String, dynamic>.from(
          event.snapshot.value as Map<dynamic, dynamic>);
      final likedbook = BookModel.fromRTDB(data);
      setState(() {
        _displayText = likedbook.title!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    final book = provider.favbook;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Consumer<FavoriteProvider>(builder: (context, state, widget) {
        var books = state.favbook;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            StreamBuilder(
              stream: _database
                  .child(userid)
                  .child("likedbooks")
                  .orderByKey()
                  .limitToLast(10)
                  .onValue,
              builder: (context, snapshot) {
                final tilesList = <ListTile>[];
                if (snapshot.hasData) {
                  final myBooks = Map<String, dynamic>.from(
                      snapshot.data!.snapshot.value as Map<dynamic, dynamic>);
                  myBooks.forEach((key, value) {
                    final nextBook = Map<String, dynamic>.from(value);
                    final bookTile = ListTile(
                      leading: Image.network(nextBook["url"]),
                      title: Text(nextBook["title"]),
                      subtitle: Text(nextBook["author"]),
                    );
                  });
                }
                return ListView(
                  children: tilesList,
                );
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 200,
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(20),
                itemCount: book.length,
                itemBuilder: (context, index) {
                  final book = books[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (context) => BookDetailPage(
                            book: book,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      child: ListTile(
                        leading: Image.network(book.thumbnailUrl.toString()),
                        title: Text(book.title.toString()),
                        subtitle: Text(book.author.toString()),
                        trailing: IconButton(
                          onPressed: () {
                            var books = <String, dynamic>{
                              "title": book.title,
                              "author": book.author,
                              "url": book.thumbnailUrl,
                            };
                            if (!provider.isExist(book)) {
                              book.taskid = reference.push().key!;
                              reference.child(book.taskid!).set(books);
                              provider.addList(book);
                            } else {
                              reference.child(book.taskid!).remove();

                              provider.removeList(book);
                            }
                          },
                          icon: Icon(Icons.close),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    _bookStream.cancel();
  }
}
