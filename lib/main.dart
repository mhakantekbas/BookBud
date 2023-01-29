// ignore_for_file: depend_on_referenced_packages

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:provider/provider.dart';
import 'package:term_project/Provider/RecommendationProvider.dart';
import 'package:term_project/pages/BaseWidget.dart';
import 'package:term_project/pages/BookListPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:term_project/pages/MyListPage.dart';
import 'package:term_project/pages/onBoarding.dart';
import 'package:term_project/pages/setting_page.dart';
import 'package:term_project/pages/splashPage.dart';
import 'package:term_project/services/notification_service.dart';
import 'package:term_project/widgets/hasData.dart';
import 'Provider/FavoriteProvider.dart';
import 'Provider/ThemeProvider.dart';
import 'Provider/TodoProvider.dart';
import 'pages/SignIn.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  // FirebaseMessaging.onBackgroundMessage(FireBaseNotificationService().backgroundMessage);
  // getFcmToken();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => TodoProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FavoriteProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RecommendationProvider(),
        )
      ],
      child: ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, child) {
          final provider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Book List',
            theme: provider.theme,
            navigatorKey: Grock.navigationKey,
            scaffoldMessengerKey: Grock.scaffoldMessengerKey,
            routes: {
              '/': (context) => SplashScreen(),
              BookPage.routeName: (context) => BookPage(),
              SettingsPage.routeName: (context) => SettingsPage(),
              SignInPage.routeName: (context) => SignInPage(),
              OnBoarding.routeName: (context) => const OnBoarding(),
              BottomBar.routeName: (context) => const BottomBar(),
              MyListPage.routeName: (context) => MyListPage(),
            },
            onUnknownRoute: (settings) => MaterialPageRoute(
              builder: (context) => const HasData(),
            ),
          );
        },
      ),
    );
  }
}
