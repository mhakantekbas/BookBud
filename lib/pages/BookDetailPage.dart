import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:term_project/services/book_api.dart';

import '../model/book_model.dart';
import '../services/dummydata.dart';

class BookDetailPage extends StatefulWidget {
  static const routeName = '/bookDetail-page';

  const BookDetailPage({super.key});

  @override
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  late Future<List<BookModel>> bookListFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bookListFuture = BookApi.fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            elevation: 5,
            expandedHeight: 200,
            stretchTriggerOffset: 100,
            flexibleSpace: FlexibleSpaceBar(
                title: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DUMMY_BOOKS[0].title,
                        style: GoogleFonts.ubuntu(fontSize: 25),
                      ),
                      Text(
                        DUMMY_BOOKS[0].category,
                        style: GoogleFonts.ubuntu(
                            color: Colors.white, fontSize: 20),
                      ),
                    ]),
                background: Container(
                  padding: EdgeInsets.all(20),
                  child: Image.network(
                    DUMMY_BOOKS[0].imageUrl,
                    alignment: Alignment.centerRight,
                  ),
                ),
                titlePadding: EdgeInsets.all(10)),
            backgroundColor: Colors.pink.withOpacity(0.6),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            childCount: 1,
            (context, index) {
              return Column(children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Categories: ",
                          style: GoogleFonts.ubuntu(fontSize: 20),
                        ),
                        Text(
                          "Published Date: ",
                          style: GoogleFonts.ubuntu(fontSize: 20),
                        ),
                        Text(
                          "ISBN-13: ",
                          style: GoogleFonts.ubuntu(fontSize: 20),
                        ),
                        Text(
                          "Language: ",
                          style: GoogleFonts.ubuntu(fontSize: 20),
                        ),
                        Text(
                          "Pages: ",
                          style: GoogleFonts.ubuntu(fontSize: 20),
                        ),
                        Text(
                          "Publisher: ",
                          style: GoogleFonts.ubuntu(fontSize: 20),
                        ),
                      ]),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                  child: Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            border:
                                Border(bottom: BorderSide(color: Colors.pink))),
                        child: Text(
                          "Description",
                          style: GoogleFonts.ubuntu(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        padding: const EdgeInsets.all(8),
                      ),
                      Container(
                        child: Text(
                          "Reviews",
                          style: GoogleFonts.ubuntu(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        padding: const EdgeInsets.all(8),
                      ),
                      Spacer(),
                      Icon(
                        Icons.favorite_border_outlined,
                        size: 30,
                      ),
                      Icon(
                        Icons.bookmark_outline_outlined,
                        size: 30,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.pink.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(DUMMY_BOOKS[0].description,
                      style: GoogleFonts.ubuntu()),
                )
              ]);
            },
          ))
        ],
      ),
    );
  }
}
