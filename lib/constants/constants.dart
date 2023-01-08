import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  Constants._();
  static const Color secondaryPrimaryColor = Color.fromARGB(255, 53, 83, 88);

  static const Color secondaryColor = Color.fromARGB(255, 255, 205, 55);

  static const Color primaryColor = Color.fromRGBO(53, 83, 88, 1);

// Fonts
  static TextStyle kTextStyleHeading = TextStyle(
      fontFamily: GoogleFonts.ubuntu().toString(),
      fontSize: 16.0,
      overflow: TextOverflow.ellipsis,
      color: Colors.grey);

  static TextStyle kTextStyleSubheading = TextStyle(
    fontFamily: GoogleFonts.ubuntu().toString(),
    fontSize: 14.0,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle kTextStyleBookTitle = GoogleFonts.ubuntu(fontSize: 25);

  static TextStyle kTextStyleBookCategory = GoogleFonts.ubuntu(fontSize: 20);

  static TextStyle kTextStyleMenuHeader =
      GoogleFonts.ubuntu(fontSize: 15, fontWeight: FontWeight.bold);

  static const TextStyle kTextStyleBody = TextStyle(
    fontSize: 16.0,
  );
}
