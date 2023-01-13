import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/hasData.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HasData(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    MediaQuery(data: MediaQueryData(), child: MaterialApp());
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color.fromARGB(255, 53, 83, 88),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: MediaQuery.of(context).size.height / 2.5,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 2.7,
            bottom: MediaQuery.of(context).size.height / 3,
            child: Container(
              child: Text(
                "BookBud",
                style: GoogleFonts.bebasNeue(fontSize: 40, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
