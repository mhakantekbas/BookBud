import 'package:flutter/material.dart';
import 'package:term_project/pages/MyListPage.dart';
import 'package:term_project/pages/ProfilePage.dart';
import 'package:term_project/pages/search_page.dart';

import '../services/dummydata.dart';

class BookListScreen extends StatefulWidget {
  static const routeName = '/book-list-screen';

  @override
  State<BookListScreen> createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  @override
  Widget build(BuildContext context) {
    int _currentindex = 0;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
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
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentindex,
            onTap: (value) {
              if (value == 0) {
                _currentindex = value;
              }
              if (value == 1) {
                _currentindex = value;
              }
              if (value == 2) {
                _currentindex = value;
              }

              setState(() {
                _currentindex = value;
              });
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    Navigator.of(context).pushNamed(SearchPage.routeName);
                  },
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {
                    Navigator.of(context).pushNamed(BookListScreen.routeName);
                  },
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    Navigator.of(context).pushNamed(ProfilePage.routeName);
                  },
                ),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: IconButton(
                  icon: Icon(Icons.book),
                  onPressed: () {
                    Navigator.of(context).pushNamed(MyListPage.routeName);
                  },
                ),
                label: 'My list',
              ),
            ]),
      ),
    );
  }
}
