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

  String userid = FirebaseAuth.instance.currentUser!.uid;

  late DatabaseReference reference =
      FirebaseDatabase.instance.ref().child(userid).child('likedbooks/');

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
              stream: BookStreamPublisher().getOrderStream(),
              builder: (context, snapshot) {
                final tilesList = <ListTile>[];
                if (snapshot.hasData) {
                  final myBooks = snapshot.data as List<BookModel>;
                  tilesList.addAll(myBooks.map((nextBook) {
                    return ListTile(
                      leading: Image.network(nextBook.thumbnailUrl!),
                      title: Text(nextBook.title!),
                      subtitle: Text(nextBook.author!),
                    );
                  }));
                } else {
                  return Center(child: CircularProgressIndicator());
                }
                return Expanded(
                    child: ListView(
                  children: tilesList,
                ));
              },
            ),
          ],
        );
      }),
    );
  }
}
