import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:term_project/model/book_model.dart';
import 'package:term_project/pages/BookDetailPage.dart';

import 'package:term_project/services/book_api.dart';
import 'package:term_project/widgets/firebase_services.dart';

import 'package:provider/provider.dart';

import '../Provider/TodoProvider.dart';
import '../widgets/BookGridViewWidget.dart';
import '../widgets/search.dart';
import '../Provider/ThemeProvider.dart';

class BookListScreen extends StatelessWidget {
  static const routeName = '/bookList-page';
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, child) {
        return MaterialApp(
          title: "BOOKS",
          debugShowCheckedModeBanner: false,
          theme: themeProvider.theme,
          home: BookPage(),
        );
      },
    );
  }
}

class BookPage extends StatefulWidget {
  BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  FirebaseServices _firebaseServices = FirebaseServices();
  late Future<List<BookModel>> bookListFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bookListFuture = BookApi.getBookData();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.list,
          color: Color.fromARGB(255, 53, 83, 88),
        ),
        centerTitle: true,
        title: Text(
          "BookBud",
          style: GoogleFonts.bebasNeue(
              fontSize: 40, color: const Color.fromARGB(255, 53, 83, 88)),
        ),
        actions: [
          InkWell(
            onTap: () {
              FirebaseAuth.instance.signOut();
              _firebaseServices.SignOut();
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
            child: const Icon(
              Icons.logout,
              color: Color.fromARGB(255, 53, 83, 88),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(
                Icons.search,
                color: Color.fromARGB(255, 66, 102, 108),
              ),
              onPressed: () {
                showSearch(context: context, delegate: SearchBook());
              },
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(30),
              // ignore: sort_child_properties_last
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recommended Books",
                      style: GoogleFonts.ubuntu(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Show All",
                      style: GoogleFonts.ubuntu(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 200,
                  child: BookGridViewWidget(
                    bookListFuture: bookListFuture,
                    provider: provider,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.blue))),
                      child: Text(
                        "Genres",
                        style: GoogleFonts.ubuntu(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      padding: const EdgeInsets.all(8),
                    ),
                    Container(
                      child: Text(
                        "Bestsellers",
                        style: GoogleFonts.ubuntu(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      padding: const EdgeInsets.all(8),
                    ),
                    Container(
                      child: Text(
                        "Newest",
                        style: GoogleFonts.ubuntu(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      padding: const EdgeInsets.all(8),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: BookGridViewWidget(
                      provider: provider, bookListFuture: bookListFuture),
                ),
              ]),
              //color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
