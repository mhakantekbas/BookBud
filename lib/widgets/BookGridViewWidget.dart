import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Provider/TodoProvider.dart';
import '../model/book_model.dart';
import '../pages/BookDetailPage.dart';

class BookGridViewWidget extends StatelessWidget {
  const BookGridViewWidget({
    Key? key,
    required this.provider,
    required this.bookListFuture,
  }) : super(key: key);

  final TodoProvider? provider;
  final Future<List<BookModel>> bookListFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BookModel>>(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<BookModel> books = snapshot.data!;
          return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 1,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 15),
              itemCount: books.length,
              itemBuilder: (BuildContext ctx, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        provider!.BookSelector(books[index]);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                BookDetailPage(book: provider!.book),
                          ),
                        );
                      },
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            width: 135,
                            height: 107,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(5),
                                color: Color.fromARGB(255, 53, 83, 88)
                                    .withOpacity(0.8)),
                          ),
                          Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  books[index].thumbnailUrl!,
                                  width: 75,
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      books[index].title!,
                      style: GoogleFonts.ubuntu(),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      books[index].author!,
                      style: GoogleFonts.ubuntu(color: Colors.grey),
                    )
                  ],
                );
              });
        } else {
          return Center(
            child: SizedBox(
              height: 40,
              width: 40,
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
      future: bookListFuture,
    );
  }
}
