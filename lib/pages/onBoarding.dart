import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:term_project/pages/BaseWidget.dart';
import 'package:term_project/pages/BookListPage.dart';

class OnBoarding extends StatefulWidget {
  static const routeName = '/onBoarding-page';
  const OnBoarding({
    super.key,
  });

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  bool favorite = false;
  final List<String> _filters = <String>[];
  List<String> get filters => _filters;
  




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 53, 83, 88),
        body: Container(
            child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Text("Pick 4 Genres to Get Started!",
                  style:
                      GoogleFonts.bebasNeue(fontSize: 40, color: Colors.white)),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 5.0),
                  Wrap(
                    spacing: 5.0,
                    children: Genres.values.map((Genres genre) {
                      return FilterChip(
                        selectedColor: const Color.fromARGB(255, 255, 205, 55),
                        backgroundColor: Color.fromARGB(146, 53, 83, 88),
                        label: Text(genre.name,
                            style: GoogleFonts.ubuntu(color: Colors.white)),
                        selected: _filters.contains(genre.name),
                        onSelected: (bool value) {
                          setState(() {
                            if (value) {
                              if (!_filters.contains(genre.name)) {
                                _filters.add(genre.name);
                              }
                            } else {
                              _filters.removeWhere((String name) {
                                return name == genre.name;
                              });
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        _filters.length < 4
                            ? Colors.grey
                            : const Color.fromARGB(255, 255, 205, 55))),
                onPressed: (() {
                  _filters.length < 4
                      ? null
                      : Navigator.of(context).pushNamed(BottomBar.routeName);
                }),
                icon: const Icon(Icons.done_outline),
                label: Text(
                  "LET'S START ${_filters.length}/4",
                  style: GoogleFonts.ubuntu(fontSize: 20),
                ))
          ],
        )));
  }
}

enum Genres {
  Inspirational,
  Horror,
  Mystery,
  Crime,
  Paranormal,
  Fantasy,
  Thrillers,
  Historical,
  Romance,
  Western,
  Science,
  Science_Fiction,
  Dystopian,
  Poetry,
}
