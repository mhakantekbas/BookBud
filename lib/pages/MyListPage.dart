import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:term_project/model/book_model.dart';

import '../Provider/FavoriteProvider.dart';
import '../services/dummydata.dart';
import 'BookDetailPage.dart';

class MyListPage extends StatelessWidget {
  const MyListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String userid = FirebaseAuth.instance.currentUser!.uid;
    DatabaseReference reference =
        FirebaseDatabase.instance.ref().child(userid).child('likedbooks/');
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
}
