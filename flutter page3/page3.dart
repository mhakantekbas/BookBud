import 'package:flutter/material.dart';
import 'package:untitled9/dummyBooks.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyApplication(),
    );
  }
}

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        appBar: AppBar(shape:
          RoundedRectangleBorder(borderRadius:BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),),
          leading: Icon(Icons.menu,size: 35),
          title: Text("HOME"),
          elevation: 0,
          backgroundColor: Colors.grey.shade700,
        ),
          backgroundColor: Colors.grey.shade200,
          body: Padding(

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
                              height:80,
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: Image.network(DUMMY_BOOKS[index].imageUrl),
                              )
                            ),
                            SizedBox(height: 10,),
                            Text(DUMMY_BOOKS[index].title,textAlign: TextAlign.center,style: TextStyle(
                              fontWeight: FontWeight.w500
                            ),)
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
          )),
    );
  }
}
