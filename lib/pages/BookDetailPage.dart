// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:term_project/services/book_api.dart';
import '../Provider/FavoriteProvider.dart';
import '../model/book_model.dart';

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
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
            padding: EdgeInsets.fromLTRB(20, 40, 0, 0),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context),
            )),
        Container(
          decoration: BoxDecoration(),
          height: MediaQuery.of(context).size.width / 1.3,
          padding: EdgeInsets.fromLTRB(10, 40, 20, 10),
          alignment: Alignment.topCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    widget.book.thumbnailUrl.toString(),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                padding: EdgeInsets.fromLTRB(20, 40, 10, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.book.title.toString(),
                      style:
                          GoogleFonts.ubuntu(fontSize: 25, color: Colors.white),
                    ),
                    Text(
                      widget.book.author.toString(),
                      style:
                          GoogleFonts.ubuntu(color: Colors.black, fontSize: 20),
                    ),
                    Row(
                      children: [
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            elevation: 10,
                          ),
                          label: Text("Favorite"),
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
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.white),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding:
                                widget.book.categories.toString().length < 30
                                    ? EdgeInsets.only(bottom: 0)
                                    : EdgeInsets.only(bottom: 20),
                            child: Text(
                              overflow: TextOverflow.visible,
                              "Categories: ",
                              style: GoogleFonts.ubuntu(
                                  fontSize: 20, color: Colors.blue),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              widget.book.categories.toString(),
                              style: GoogleFonts.ubuntu(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Language: ",
                            style: GoogleFonts.ubuntu(
                                fontSize: 20, color: Colors.blue),
                          ),
                          Text(
                            widget.book.language.toString(),
                            style: GoogleFonts.ubuntu(fontSize: 20),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Pages: ",
                            style: GoogleFonts.ubuntu(
                                fontSize: 20, color: Colors.blue),
                          ),
                          Text(
                            widget.book.page.toString(),
                            style: GoogleFonts.ubuntu(fontSize: 20),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding:
                                widget.book.publisher.toString().length < 30
                                    ? EdgeInsets.only(bottom: 0)
                                    : EdgeInsets.only(bottom: 20),
                            child: Text(
                              "Publisher: ",
                              style: GoogleFonts.ubuntu(
                                  fontSize: 20, color: Colors.blue),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              widget.book.publisher.toString(),
                              style: GoogleFonts.ubuntu(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Publish Date: ",
                            style: GoogleFonts.ubuntu(
                                fontSize: 20, color: Colors.blue),
                          ),
                          Text(
                            widget.book.publishdate.toString(),
                            style: GoogleFonts.ubuntu(fontSize: 20),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            widget.book.isbntype.toString() + ": ",
                            style: GoogleFonts.ubuntu(
                                fontSize: 20, color: Colors.blue),
                          ),
                          Text(
                            widget.book.isbn.toString(),
                            style: GoogleFonts.ubuntu(fontSize: 20),
                          ),
                        ],
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
                              Border(bottom: BorderSide(color: Colors.grey))),
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
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.6),
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
                child: Text(widget.book.description.toString()),
              ),
            ],
          ),
        )
      ])),
    );
  }
}
