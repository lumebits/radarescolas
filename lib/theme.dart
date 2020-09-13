import 'package:flutter/material.dart';

final MaterialColor jhPrimaryColor =  createMaterialColor(Color.fromARGB(255, 0, 158, 224));
final MaterialColor jhSecondaryColor =  createMaterialColor(Color.fromARGB(255, 0, 112, 174)); // #0070ae
final MaterialAccentColor jhPrimaryColorAccent =  createMaterialAccentColor(Color.fromARGB(255, 0, 158, 224)); // #62cfff
final MaterialAccentColor jhSecondaryColorAccent =  createMaterialAccentColor(Color.fromARGB(255, 0, 112, 174));

final double header1FontSize =  30.0;
final double header3FontSize =  25.0;
final double header6FontSize =  20.0;
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
        color: Colors.black, fontSize: header1FontSize, fontWeight: FontWeight.bold),
    headline3: TextStyle(
        color: Colors.black, fontSize: header3FontSize, fontWeight: FontWeight.bold),
    headline4: TextStyle(
        color: Colors.black, fontSize: header3FontSize, fontWeight: FontWeight.bold),
    headline6: TextStyle(
        color: Colors.white, fontSize: header6FontSize, fontWeight: FontWeight.bold, letterSpacing: 0.15),
    bodyText1: TextStyle(color: Colors.black, fontSize: baseFontSize),
    bodyText2: TextStyle(color: Colors.black, fontSize: baseFontSize),
    button: TextStyle(
      fontSize: baseFontSize,
    ),
  ),
);


MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}

MaterialAccentColor createMaterialAccentColor(Color color) {
  List strengths = <double>[.05];
  Map swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialAccentColor(color.value, swatch);
}