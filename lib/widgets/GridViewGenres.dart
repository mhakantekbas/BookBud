import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pages/onBoarding.dart';
import '../model/book_model.dart';
import '../pages/BookDetailPage.dart';

class Genres extends StatelessWidget {
  Genres({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> genres = [
      "Inspirational",
      "Horror",
      "Mystery",
      "Crime",
      "Paranormal",
      "Fantasy",
      "Thrillers",
      "Historical",
      "Romance",
      "Western",
      "Science",
      "Science_Fiction",
      "Dystopian",
      "Poetry",
    ];
    return Container(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: 10,
            itemBuilder: (BuildContext ctx, index) {
              return Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 205, 55),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(child: Text(genres[index])));
            }));
  }
}
