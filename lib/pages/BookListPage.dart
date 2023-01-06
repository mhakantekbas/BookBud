import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:term_project/model/book_model.dart';
import 'package:term_project/pages/BookDetailPage.dart';
import 'package:term_project/pages/MyListPage.dart';
import 'package:term_project/pages/ProfilePage.dart';
import 'package:term_project/pages/SignIn.dart';
import 'package:term_project/pages/login_page.dart';
import 'package:term_project/pages/search_page.dart';
import 'package:term_project/services/book_api.dart';
import 'package:term_project/widgets/firebase_services.dart';
import 'package:term_project/widgets/hasData.dart';
import 'package:provider/provider.dart';
import '../Provider/FavoriteProvider.dart';
import '../Provider/TodoProvider.dart';
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
          "Books",
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
              RecommendedBooks(bookListFuture: bookListFuture),
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.blue))),
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
                height: 820,
                child: FutureBuilder<List<BookModel>>(
                  builder:(context, snapshot) {
                    if(snapshot.hasData!){
                   List<BookModel>  books =snapshot.data!;
                   return GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
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
                             GestureDetector(
                               onTap: () {
                                 provider.BookSelector(books[index]);
                                 Navigator.push(
                                   context,
                                   new MaterialPageRoute(
                                     builder: (context) => new BookDetailPage(book:provider.book),
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
                                         color: Colors.amber.withOpacity(0.8)),
                                   ),
                                   Column(
                                     children: [
                                       ClipRRect(
                                         borderRadius: BorderRadius.circular(8),
                                         child: Image.network(
                                           books[index].thumbnailUrl!,
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
                       });
                    }else{
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
                ),
              ),
            ]),
            color: Colors.white,
          ),
        ],
      )),
    );
  }
}

class RecommendedBooks extends StatelessWidget {
  const RecommendedBooks({
    Key? key,
    required this.bookListFuture,
  }) : super(key: key);

  final Future<List<BookModel>> bookListFuture;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
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
                                    imageUrl: books[index].thumbnailUrl!,
                                    width: 75,
                                    height: 120,
                                    fit: BoxFit.cover,
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
          future: bookListFuture,
        ));
  }
}
