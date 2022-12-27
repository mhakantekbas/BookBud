import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:term_project/pages/login_page.dart';
import '../pages/BaseWidget.dart';
import '../pages/BookListPage.dart';

class HasData extends StatelessWidget {
  const HasData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return BottomBar();
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
