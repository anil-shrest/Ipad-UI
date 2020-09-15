import 'package:flutter/material.dart';
import 'size_config.dart';

class AppTheme {
  AppTheme._();

  Color primaryColor = Color(0xff18203d);
  Color secondaryColor = Color(0xff232c51);
  Color logoGreen = Colors.tealAccent[700];

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xff18203d),
    brightness: Brightness.light,
    textTheme: lightTextTheme,
  );

  static final TextTheme lightTextTheme = TextTheme(
    headline2: _titleLight,
    headline3: _subTitleLight,
    button: _buttonLight,
  );

  static final TextStyle _titleLight = TextStyle(
    color: Colors.white,
    fontSize: 3.2 * SizeConfig.textMultiplier,
  );

  static final TextStyle _subTitleLight = TextStyle(
    color: Colors.white,
    fontSize: 3.5 * SizeConfig.textMultiplier,
    height: 1.5,
  );

  static final TextStyle _buttonLight = TextStyle(
    color: Colors.white,
    fontSize: 2 * SizeConfig.textMultiplier,
  );
}
