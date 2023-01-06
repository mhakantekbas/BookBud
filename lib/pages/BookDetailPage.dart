// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:term_project/services/book_api.dart';

import '../Provider/FavoriteProvider.dart';
import '../model/book_model.dart';
import '../services/dummydata.dart';

class BookDetailPage extends StatefulWidget {
  BookModel book;
  static const routeName = '/bookDetail-page';

  BookDetailPage({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  late Future<List<BookModel>> bookListFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bookListFuture = BookApi.getBookData();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.pop(context)),
            pinned: false,
            elevation: 5,
            expandedHeight: 200,
            stretchTriggerOffset: 100,
            flexibleSpace: FlexibleSpaceBar(
                title: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.book.title!,
                        style: GoogleFonts.ubuntu(fontSize: 25),
                      ),
                      Text(
                        widget.book.author!,
                        style: GoogleFonts.ubuntu(
                            color: Colors.white, fontSize: 20),
                      ),
                    ]),
                background: Container(
                  padding: const EdgeInsets.all(20),
                  child: Image.network(
                    widget.book.thumbnailUrl!,
                    alignment: Alignment.centerRight,
                  ),
                ),
                titlePadding: const EdgeInsets.all(10)),
            backgroundColor: Colors.pink,
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            childCount: 1,
            (context, index) {
              return Column(children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
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
                  padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                  child: Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            border:
                                Border(bottom: BorderSide(color: Colors.pink))),
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          "Description",
                          style: GoogleFonts.ubuntu(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          "Reviews",
                          style: GoogleFonts.ubuntu(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: provider.isExist(widget.book)
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : const Icon(Icons.favorite_border_outlined),
                        onPressed: () {
                          provider.toggleFavorite(widget.book);
                        },
                      ),
                      const Icon(
                        Icons.bookmark_outline_outlined,
                        size: 30,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.pink.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(widget.book.description!,
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
