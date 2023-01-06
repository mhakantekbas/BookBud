import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/FavoriteProvider.dart';
import '../services/dummydata.dart';
import 'BookDetailPage.dart';

class MyListPage extends StatelessWidget {
  const MyListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    final books = provider.favbook;
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return ListTile(
            title: Text(book.title.toString()),
            trailing: IconButton(
              onPressed: () {
                provider.toggleFavorite(book);
              },
              icon: provider.isExist(book)
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : const Icon(Icons.favorite_border_outlined),
            ),
          );
        },
      ),
    );
  }
}
