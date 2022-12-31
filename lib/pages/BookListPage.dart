import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:term_project/model/book_model.dart';
import 'package:term_project/pages/MyListPage.dart';
import 'package:term_project/pages/ProfilePage.dart';
import 'package:term_project/pages/SignIn.dart';
import 'package:term_project/pages/login_page.dart';
import 'package:term_project/pages/search_page.dart';
import 'package:term_project/services/book_api.dart';
import 'package:term_project/widgets/firebase_services.dart';
import 'package:term_project/widgets/hasData.dart';

import '../services/dummydata.dart';

class BookListScreen extends StatelessWidget {
  static const routeName = '/bookList-page';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BOOKS",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey),
      home: BookPage(),
    );
  }
}

class BookPage extends StatefulWidget {
  BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  List<BookModel> books = [];
  final FirebaseServices _firebaseServices = FirebaseServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.list,
          color: Color.fromARGB(255, 53, 83, 88),
        ),
        centerTitle: true,
        title: Text(
          "Books",
          style: GoogleFonts.bebasNeue(
              fontSize: 40, color: const Color.fromARGB(255, 53, 83, 88)),
        ),
        actions: [
          InkWell(
            onTap: () {
              FirebaseAuth.instance.signOut();
              _firebaseServices.SignOut();
              Navigator.of(context).pushNamed(LoginPage.routeName);
            },
            child: const Icon(Icons.logout),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              color: Color.fromARGB(255, 53, 83, 88),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(30),
            color: Colors.white,
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
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
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
                                    color: Colors.green.withOpacity(0.8)),
                              ),
                              Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      books[index].thumbnailUrl,
                                      width: 75,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
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
                    }),
              ),
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.blue))),
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      "Genres",
                      style: GoogleFonts.ubuntu(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      "Bestsellers",
                      style: GoogleFonts.ubuntu(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      "Newest",
                      style: GoogleFonts.ubuntu(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 500,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 1,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 15),
                    itemCount: DUMMY_BOOKS.length,
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
                                    color: Colors.amber.withOpacity(0.8)),
                              ),
                              Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      "https://img.kitapyurdu.com/v1/getImage/fn:11582810/wh:true/wi:220",
                                      width: 75,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "BookName",
                            style: GoogleFonts.ubuntu(),
                          ),
                          Text(
                            "Author",
                            style: GoogleFonts.ubuntu(color: Colors.grey),
                          )
                        ],
                      );
                    }),
              ),
            ]),
          ),
        ],
      )),
    );
  }

  void fetchBooks() async {
    var response = await BookApi.fetchBooks();
    books = response;
  }
}
