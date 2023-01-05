import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:term_project/services/book_api.dart';
import 'package:term_project/widgets/BookFutureBuilderWidget.dart';

import '../model/book_model.dart';

class SearchBook extends SearchDelegate {
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
    return Container(
        padding: EdgeInsets.all(30),
        child: BookFutureBuilder(
          bookListFuture: BookApi.getDataByQuery(q: query),
        ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text('Search Book'),
    );
  }
}
