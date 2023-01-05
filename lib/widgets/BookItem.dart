import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:term_project/pages/BookDetailPage.dart';

import '../model/book_model.dart';
import 'BookFutureBuilderWidget.dart';

class BookItem extends StatelessWidget {
  const BookItem({
    Key? key,
    required this.bookListFuture,
  }) : super(key: key);

  final Future<List<BookModel>> bookListFuture;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200, child: BookFutureBuilder(bookListFuture: bookListFuture));
  }
}
