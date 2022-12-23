import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LibraryBook extends StatelessWidget {
  List<Book> bookList = [
    Book(
        title: 'Emma - Jane Austen',
        year: 2008,
        imageUrl: 'https://www.storytel.com/images/e/640x640/0001149185.jpg'),
    Book(
        title: 'Mansfield Park - Jane Austen',
        year: 2008,
        imageUrl: 'https://www.storytel.com/images/e/640x640/0001149185.jpg'),
    Book(
        title: 'Jane Eyre - Charlotte Brontë ',
        year: 2019,
        imageUrl: 'https://www.storytel.com/images/e/640x640/0001149185.jpg'),
    Book(
        title: 'Crime and Punishment - Fyodor Dostoevsky',
        year: 1866,
        imageUrl: 'https://www.storytel.com/images/e/640x640/0001149185.jpg'),
    Book(
        title: 'Anna Karenina - Leo Tolstoy ',
        year: 1870,
        imageUrl: 'https://www.storytel.com/images/e/640x640/0001149185.jpg'),
    Book(
        title: 'Great Expectations - Charles Dickens ',
        year: 1759,
        imageUrl: 'https://www.storytel.com/images/e/640x640/0001149185.jpg'),
    Book(
        title: 'The Belly of Paris - Émile Zola ',
        year: 1851,
        imageUrl: 'https://www.storytel.com/images/e/640x640/0001149185.jpg'),
    Book(
        title: 'The Bright Side of Life - Émile Zola ',
        year: 2008,
        imageUrl: 'https://www.storytel.com/images/e/640x640/0001149185.jpg'),
    Book(
        title: 'Emma ',
        year: 2008,
        imageUrl: 'https://www.storytel.com/images/e/640x640/0001149185.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.book_outlined),
        title: Text('My List'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 500,
            child: ListView.builder(
              padding: EdgeInsets.all(20),
              itemCount: bookList.length,
              itemBuilder: (bc, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Card(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        /* Image.network(
                          bookList[index].imageUrl,
                          width: 20,
                          height: 30,
                        ),*/
                        //SizedBox(width: 10,),
                        Container(
                          width: 250.0,
                          margin: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(bookList[index].title),
                              Text(
                                bookList[index].year.toString(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Book {
  String title;
  int year;
  String imageUrl;
  Book({required this.title, required this.year, required this.imageUrl});
}
