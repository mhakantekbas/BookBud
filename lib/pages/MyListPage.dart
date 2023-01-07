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
                            provider.toggleFavorite(book);
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
