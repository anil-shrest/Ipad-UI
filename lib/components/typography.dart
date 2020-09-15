import 'size_config.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';


TextStyle headlineTextStyle = GoogleFonts.montserrat(
    textStyle: TextStyle(
        fontSize: 8 * SizeConfig.textMultiplier,
        color: Colors.black,
        letterSpacing: 1.5,
        fontWeight: FontWeight.w500));

TextStyle headlineSecondaryTextStyle = GoogleFonts.montserrat(
    textStyle: TextStyle(
        fontSize: 3 * SizeConfig.textMultiplier,
        color: Colors.black,
        fontWeight: FontWeight.w300));

TextStyle subtitleTextStyle = GoogleFonts.openSans(
    textStyle: TextStyle(fontSize: 14, color: Colors.red, letterSpacing: 1));

TextStyle bodyTextStyle = GoogleFonts.openSans(
    textStyle: TextStyle(fontSize: 14, color: Colors.white));

TextStyle buttonTextStyle = GoogleFonts.montserrat(
    textStyle: TextStyle(fontSize: 20, color: Colors.white, letterSpacing: 1));

TextStyle username = TextStyle(
    fontSize: 3.9 * SizeConfig.textMultiplier,
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontFamily: 'pacifico');

TextStyle userinfo = TextStyle(
    fontSize: 3 * SizeConfig.textMultiplier,
    color: Colors.teal[200],
    letterSpacing: 2.0,
    fontWeight: FontWeight.bold,
    fontFamily: 'Sans');

TextStyle usernumber_email = TextStyle(
    fontSize: 3.2 * SizeConfig.textMultiplier,
    color: Colors.teal[900],
//    fontWeight: FontWeight.bold,
    fontFamily: 'Sans');
