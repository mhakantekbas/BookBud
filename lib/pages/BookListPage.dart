import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:term_project/pages/MyListPage.dart';
import 'package:term_project/pages/ProfilePage.dart';
import 'package:term_project/pages/search_page.dart';
import 'package:term_project/widgets/firebase_services.dart';

import '../services/dummydata.dart';

class BookListScreen extends StatefulWidget {
  static const routeName = '/book-list-screen';

  @override
  State<BookListScreen> createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  FirebaseServices _firebaseServices = FirebaseServices();
  @override
  Widget build(BuildContext context) {
    int _currentindex = 0;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [
            MaterialButton(
              onPressed: (() {
                FirebaseAuth.instance.signOut();
                _firebaseServices.SignOut();
              }),
              child: Icon(Icons.logout),
            )
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
          ),
          leading: Icon(Icons.menu, size: 35),
          title: Text("HOME"),
          elevation: 0,
          backgroundColor: Color.fromRGBO(53, 83, 88, 1),
        ),
        backgroundColor: Colors.grey.shade200,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ListView.separated(
              itemBuilder: (context, index) => SingleChildScrollView(
                padding: EdgeInsets.only(left: 15),
                scrollDirection: Axis.horizontal,
                child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      width: 20,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: DUMMY_BOOKS.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 125,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: 80,
                                child: Container(
                                  child: Image.network(
                                    DUMMY_BOOKS[index].imageUrl,
                                    fit: BoxFit.fill,
                                  ),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              DUMMY_BOOKS[index].title,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              separatorBuilder: (context, index) => Column(
                children: [
                  SizedBox(height: 15),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 3),
                      child: Text(
                        "Book Category",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    height: MediaQuery.of(context).size.height * 0.025,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(3)),
                  ),
                  SizedBox(
                    height: 9,
                  )
                ],
              ),
              itemCount: 5,
            ),
          ),
        ),
      ),
    );
  }
}
