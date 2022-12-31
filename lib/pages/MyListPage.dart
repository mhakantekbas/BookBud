import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:term_project/widgets/firebase_services.dart';

import '../services/dummydata.dart';

class MyListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.book_outlined),
        title: const Text('My List'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - 200,
            child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20),
              itemCount: DUMMY_BOOKS.length,
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
                          margin: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(DUMMY_BOOKS[index].title),
                              Text(
                                DUMMY_BOOKS[index].year.toString(),
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
