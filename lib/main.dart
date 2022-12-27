import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:term_project/pages/BaseWidget.dart';
import 'package:term_project/pages/BookListPage.dart';
import 'package:term_project/pages/MyListPage.dart';
import 'package:term_project/pages/ProfilePage.dart';
import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:term_project/pages/login_page.dart';
import 'package:term_project/pages/onBoarding.dart';
import 'package:term_project/pages/search_page.dart';
import 'package:term_project/pages/setting_page.dart';
import 'package:term_project/widgets/hasData.dart';
import 'pages/SignIn.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book List',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(primary: Color.fromRGBO(53, 83, 88, 1))),
      initialRoute: '/',
      routes: {
        '/': (context) => HasData(),
        BookListScreen.routeName: (context) => BookListScreen(),
        MyListPage.routeName: (context) => MyListPage(),
        OnBoarding.routeName: (context) => const OnBoarding(),
        ProfilePage.routeName: (context) => ProfilePage(),
        SearchPage.routeName: (context) => const SearchPage(),
        SettingsPage.routeName: (context) => SettingsPage(),
        SignInPage.routeName: (context) => SignInPage(),
      },
    );
  }
}

class BookList extends StatefulWidget {
  const BookList({super.key});

  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  // A list to store the books
  List<Book> books = [];

  // Function to fetch the books from the Google Books API
  Future<void> fetchBooks() async {
    // Make the HTTP request to the Google Books API
    var response = await http.get(
        Uri.parse('https://www.googleapis.com/books/v1/volumes?q=flutter'));

    // Check if the request was successful
    if (response.statusCode == 200) {
      // If the request was successful, parse the JSON response
      var data = json.decode(response.body);
      var bookList = data['items'];

      // Iterate over the list of books and add them to the books list
      bookList.forEach((book) {
        var bookModel = Book.fromJson(book);
        books.add(bookModel);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book List'),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          // Display the title of each book in a list item
          return ListTile(
            title: Text(books[index].title),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchBooks,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

// Book model class
class Book {
  final String title;

  Book({required this.title});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['volumeInfo']['title'],
    );
  }
}
