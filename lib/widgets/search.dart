import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:term_project/services/book_api.dart';

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
      child: FutureBuilder<List<BookModel>>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<BookModel> books = snapshot.data!;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 1,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 15),
              itemCount: books.length,
              itemBuilder: (BuildContext ctx, index) {
                return Column(
                  children: [
                    Stack(
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
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: CachedNetworkImage(
                                  imageUrl: books[index].thumbnailUrl,
                                  width: 75,
                                  fit: BoxFit.fitHeight,
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      books[index].title,
                      style: GoogleFonts.ubuntu(),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      books[index].author,
                      style: GoogleFonts.ubuntu(color: Colors.grey),
                    )
                  ],
                );
              },
            );
          } else {
            const Center(
              child: SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator(),
              ),
            );
          }
          return const Center(
            child: SizedBox(
              height: 40,
              width: 40,
              child: CircularProgressIndicator(),
            ),
          );
        },
        future: BookApi.getDataByQuery(query),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text('Search Book'),
    );
  }
}
