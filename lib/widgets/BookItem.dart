import 'dart:js';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:term_project/Provider/TodoProvider.dart';
import 'package:term_project/pages/BookDetailPage.dart';
import '';

import '../model/book_model.dart';
import 'BookGridViewWidget.dart';

class BookItem extends StatelessWidget {
  BookItem({
    Key? key,
    required this.bookListFuture,
  }) : super(key: key);

  final Future<List<BookModel>> bookListFuture;

  @override
  Widget build(BuildContext context) {
    TodoProvider todoProvider = Provider.of<TodoProvider>(context);
    return SizedBox(
        height: 200,
        child: BookGridViewWidget(
          bookListFuture: bookListFuture,
          provider: todoProvider,
        ));
  }
}
