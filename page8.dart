import 'package:flutter/material.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final List<Segments> myList = [
    Segments(
        icon: Icon(
          Icons.list,
          color: Colors.yellow,
        ),
        title: 'My List'),
    Segments(
        icon: Icon(Icons.reviews_sharp, color: Colors.yellow),
        title: 'Reviews'),
    Segments(
        icon: Icon(Icons.favorite_border_outlined, color: Colors.yellow),
        title: 'Liked Books'),
    Segments(
        icon: Icon(Icons.settings, color: Colors.yellow), title: 'Settings'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.person_sharp,
          color: Colors.yellow,
        ),
        title: Text('Profile'),
        backgroundColor: Color.fromRGBO(53, 83, 88, 1),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            height: 200,
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  height: 150,
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(
                        'https://media.licdn.com/dms/image/D4D03AQFsj34yERBeVw/profile-displayphoto-shrink_800_800/0/1667497662071?e=1677110400&v=beta&t=bB_zSuX3fsvdkURr1zUAKAlWZWEFLTAXK_Eb1PSpGVE'),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Sekvan Durak',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: myList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Card(
                      color: Color.fromRGBO(53, 83, 88, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      elevation: 5,
                      child: ListTile(
                        leading: myList[index].icon,
                        title: Text(
                          myList[index].title,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
      bottomNavigationBar:
          BottomNavigationBar(type: BottomNavigationBarType.fixed, items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
        ),
      ]),
    );
  }
}

class Segments {
  final Icon icon;
  final String title;

  Segments({required this.icon, required this.title});
}
