import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:term_project/pages/BaseWidget.dart';
import 'package:term_project/pages/BookListPage.dart';
import 'package:term_project/pages/MyListPage.dart';
import 'package:term_project/pages/ProfilePage.dart';
import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:term_project/pages/login_page.dart';
import 'package:term_project/pages/onBoarding.dart';
import 'package:term_project/pages/search_page.dart';
import 'package:term_project/pages/setting_page.dart';
import 'package:term_project/widgets/hasData.dart';
import 'pages/SignIn.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book List',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(primary: Color.fromRGBO(53, 83, 88, 1))),
      home: HasData(),
      routes: {
        BookListScreen.routeName: (context) => BookListScreen(),
        SettingsPage.routeName: (context) => SettingsPage(),
        SignInPage.routeName: (context) => SignInPage(),
        OnBoarding.routeName: (context) => OnBoarding(),
        BottomBar.routeName: (context) => BottomBar(),
        LoginPage.routeName: (context) => LoginPage(),
      },
    );
  }
}
