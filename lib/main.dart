// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:term_project/pages/BaseWidget.dart';
import 'package:term_project/pages/BookListPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:term_project/pages/onBoarding.dart';
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
              .copyWith(primary: const Color.fromRGBO(53, 83, 88, 1))),
      routes: {
        '/': (context) => const HasData(),
        BookPage.routeName: (context) => BookPage(),
        SettingsPage.routeName: (context) => SettingsPage(),
        SignInPage.routeName: (context) => SignInPage(),
        OnBoarding.routeName: (context) => const OnBoarding(),
        BottomBar.routeName: (context) => const BottomBar()
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => const HasData(),
      ),
    );
  }
}
