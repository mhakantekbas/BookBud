import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:term_project/pages/MyListPage.dart';
import 'package:term_project/pages/ProfilePage.dart';
import 'package:term_project/pages/SignIn.dart';
import 'package:term_project/pages/login_page.dart';
import 'package:term_project/pages/search_page.dart';
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
  FirebaseServices _firebaseServices = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.list,
          color: Color.fromARGB(255, 53, 83, 88),
        ),
        centerTitle: true,
        title: Text(
          "Books",
          style: GoogleFonts.bebasNeue(
              fontSize: 40, color: Color.fromARGB(255, 53, 83, 88)),
        ),
        actions: [
          InkWell(
            onTap: () {
              FirebaseAuth.instance.signOut();
              _firebaseServices.SignOut();
              Navigator.of(context).pushNamed(LoginPage.routeName);
            },
            child: Icon(Icons.logout),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
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
            padding: EdgeInsets.all(30),
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
              SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 1,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 15),
                    itemCount: 2,
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
                                        offset: Offset(0, 3),
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
                                      "https://img.kitapyurdu.com/v1/getImage/fn:11582810/wh:true/wi:220",
                                      width: 75,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
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
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.blue))),
                    child: Text(
                      "Genres",
                      style: GoogleFonts.ubuntu(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(8),
                  ),
                  Container(
                    child: Text(
                      "Bestsellers",
                      style: GoogleFonts.ubuntu(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(8),
                  ),
                  Container(
                    child: Text(
                      "Newest",
                      style: GoogleFonts.ubuntu(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(8),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
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
                                        offset: Offset(0, 3),
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
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
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
            color: Colors.white,
          ),
        ],
      )),
    );
  }
}
