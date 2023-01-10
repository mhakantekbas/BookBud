import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:term_project/Provider/TodoProvider.dart';
import 'package:term_project/services/book_api.dart';
import 'package:term_project/widgets/BookGridViewWidget.dart';

class SearchBook extends SearchDelegate {
  ScrollController controller = ScrollController();
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(
            Icons.close,
            color: const Color.fromRGBO(53, 83, 88, 1),
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: const Color.fromRGBO(53, 83, 88, 1),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    TodoProvider todoProvider = Provider.of<TodoProvider>(context);
    return Container(
        padding: EdgeInsets.all(30),
        child: BookGridViewWidget(
          provider: todoProvider,
          bookListFuture: BookApi.getDataByQuery(q: query),
          controller: controller,
        ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Image.network(
          'https://cdn-icons-png.flaticon.com/512/3402/3402366.png',
          cacheHeight: 150),
    );
  }
}
