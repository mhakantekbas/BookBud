import 'package:flutter/material.dart';
import 'package:term_project/model/book_model.dart';
import 'package:term_project/services/book_api.dart';

class BookList extends StatefulWidget {
  const BookList({Key? key}) : super(key: key);

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  late Future<List<BookModel>> _bookListFuture;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _bookListFuture = BookApi.getPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BookModel>>(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<BookModel> myList = snapshot.data!;

          return GridView.builder(
              itemCount: myList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (context, index) => Text(myList[index].toString()));
        } else if (snapshot.hasError) {
          return Center(
            child: Text("${snapshot.error}"),
          );
        } else {
          const CircularProgressIndicator();
        }
        return const CircularProgressIndicator();
      },
      future: _bookListFuture,
    );
  }
}
