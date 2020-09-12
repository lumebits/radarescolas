import 'package:flutter/material.dart';

final MaterialColor jhPrimaryColor =  Colors.indigo;
final MaterialColor jhSecondaryColor =  Colors.pink;
final MaterialAccentColor jhPrimaryColorAccent =  Colors.indigoAccent;
final MaterialAccentColor jhSecondaryColorAccent =  Colors.pinkAccent;

final double header1FontSize =  30.0;
final double header3FontSize =  25.0;
final double baseFontSize =  15.0;

final String jhFont =  'Roboto';

final theme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  fontFamily: jhFont,
  primaryColor: jhPrimaryColor,
  errorColor: Colors.red,
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(),
    errorStyle: TextStyle(color: Colors.red),
  ),
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  colorScheme: ColorScheme.light(
      primary: jhPrimaryColor,
      onPrimary: jhPrimaryColor,
      primaryVariant: jhPrimaryColorAccent,
      secondary: jhSecondaryColor,
      secondaryVariant: jhSecondaryColorAccent,
      error: Colors.red),
  cardTheme: CardTheme(
    color: jhPrimaryColor,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: jhPrimaryColor,
    textTheme: ButtonTextTheme.primary,
    colorScheme: ColorScheme.light(primary: jhPrimaryColor),
    height: 50,
  ),
  iconTheme: IconThemeData(
    color: Colors.white54,
  ),
  textTheme: TextTheme(
    headline1: TextStyle(
        color: Colors.black, fontSize: header1FontSize, fontWeight: FontWeight.bold),
    headline2: TextStyle(
        color: Colors.white, fontSize: header1FontSize, fontWeight: FontWeight.bold),
    headline3: TextStyle(
        color: Colors.black, fontSize: header3FontSize, fontWeight: FontWeight.bold),
    headline4: TextStyle(
        color: Colors.white, fontSize: header3FontSize, fontWeight: FontWeight.bold),
    bodyText1: TextStyle(color: Colors.black, fontSize: baseFontSize),
    bodyText2: TextStyle(color: Colors.white, fontSize: baseFontSize),
    button: TextStyle(
      fontSize: baseFontSize,
    ),
  ),
);

