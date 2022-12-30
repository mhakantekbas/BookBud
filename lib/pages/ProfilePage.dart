import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:term_project/pages/setting_page.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
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
                        "${FirebaseAuth.instance.currentUser!.photoURL}"),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "${FirebaseAuth.instance.currentUser!.displayName}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  "${FirebaseAuth.instance.currentUser!.email}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.grey),
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
                    child: GestureDetector(
                      onTap: () => Navigator.of(context)
                          .pushNamed(SettingsPage.routeName),
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
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class Segments {
  final Icon icon;
  final String title;

  Segments({required this.icon, required this.title});
}
