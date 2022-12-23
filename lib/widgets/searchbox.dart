import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width - 150,
      height: 48,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20 / 4),
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF262C96)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)),
      child: const TextField(
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              icon: Icon(
                Icons.search,
                color: Color(0xFF262C96),
              ),
              hintText: 'Search Books',
              hintStyle: TextStyle(color: Colors.grey))),
    );
  }
}
