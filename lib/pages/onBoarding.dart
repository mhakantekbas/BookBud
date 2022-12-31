import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 53, 83, 88),
          ),
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              "Pick 3 Genres to Get Started!",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
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
                children: ExerciseFilter.values.map((ExerciseFilter exercise) {
                  return FilterChip(
                    selectedColor: const Color.fromARGB(255, 255, 205, 55),
                    backgroundColor: const Color.fromARGB(255, 53, 83, 88),
                    label: Text(
                      exercise.name,
                      style: const TextStyle(color: Colors.white),
                    ),
                    selected: _filters.contains(exercise.name),
                    onSelected: (bool value) {
                      setState(() {
                        if (value) {
                          if (!_filters.contains(exercise.name)) {
                            _filters.add(exercise.name);
                          }
                        } else {
                          _filters.removeWhere((String name) {
                            return name == exercise.name;
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
            label: Text("LET'S START 4/${_filters.length}"))
      ],
    )));
  }
}

enum ExerciseFilter {
  Fantasy,
  Philosophy,
  Psychology,
  Horror,
  Dystopian,
  Biography,
  Science_Fiction,
  Non_Fiction,
  Mystery,
  Thriller,
}
