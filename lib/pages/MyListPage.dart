import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:term_project/model/BookStreamPublisher.dart';
import 'package:term_project/model/book_model.dart';

import '../Provider/FavoriteProvider.dart';
import 'BookDetailPage.dart';

class MyListPage extends StatelessWidget {
  MyListPage({Key? key}) : super(key: key);

  late DatabaseReference reference =
      FirebaseDatabase.instance.ref().child(userid).child('likedbooks/');

  String userid = FirebaseAuth.instance.currentUser!.uid;

  final _database = FirebaseDatabase.instance.ref();

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
                  .onValue,
              builder: (context, snapshot) {
                final tilesList = <ListTile>[];
                if (snapshot.hasData) {
                  final myBooks = Map<String, dynamic>.from(
                      snapshot.data!.snapshot.value as Map<dynamic, dynamic>);
                  myBooks.forEach((key, value) {
                    final nextbook =
                        BookModel.fromRTDB(Map<String, dynamic>.from(value));
                    final bookTile = ListTile(
                      leading: Image.network(nextbook.thumbnailUrl!),
                      title: Text(nextbook.title!),
                      subtitle: Text(nextbook.author!),
                    );
                    tilesList.add(bookTile);
                  });
                } else {
                  return CircularProgressIndicator();
                }
                return Expanded(child: ListView(children: tilesList));
              },
            ),
          ],
        );
      }),
    );
  }
}
