import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  ///default
  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);

  ///app
  static const Color black = Color(0xFF12121D);
  static const Color black60 = Color.fromRGBO(18, 18, 29, 0.6);
  static const Color black30 = Color.fromRGBO(18, 18, 29, 0.3);
  static const Color black10 = Color.fromRGBO(18, 18, 29, 0.1);
  static const Color black5 = Color.fromRGBO(18, 18, 29, 0.05);
  static const Color white = Color(0xFFFFFFFF);
  static const Color white60 = Color.fromRGBO(225, 225, 225, 0.6);
  static const Color white30 = Color.fromRGBO(225, 225, 225, 0.3);
  static const Color white10 = Color.fromRGBO(225, 225, 225, 0.1);
  static const Color white5 = Color.fromRGBO(225, 225, 225, 0.05);
  static const Color red = Color(0xFFFF2343);
  static const Color green = Color(0xFF42D70D);
  static const Color blue = Color(0xFF0008C7);

  ///fonts
  static const String fontDisplay = 'SFProDisplay';
  static const String fontText = 'SFProText';
  static const String fontPoppins = 'Poppins';

  static const TextTheme textTheme = TextTheme(
    headline4: display1,
    headline5: headline,
    headline6: title,
    subtitle2: subtitle,
    bodyText2: body2,
    bodyText1: body1,
    caption: caption,
  );

  static const TextStyle display1 = TextStyle(
    // h4 -> display1
    fontFamily: fontDisplay,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: darkerText,
  );

  static const TextStyle headline = TextStyle(
    // h5 -> headline
    fontFamily: fontDisplay,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: darkerText,
  );

  static const TextStyle title = TextStyle(
    // h6 -> title
    fontFamily: fontDisplay,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: darkerText,
  );

  static const TextStyle subtitle = TextStyle(
    // subtitle2 -> subtitle
    fontFamily: fontDisplay,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: darkText,
  );

  static const TextStyle body2 = TextStyle(
    // body1 -> body2
    fontFamily: fontDisplay,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: darkText,
  );

  static const TextStyle body1 = TextStyle(
    // body2 -> body1
    fontFamily: fontDisplay,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: darkText,
  );

  static const TextStyle caption = TextStyle(
    // Caption -> caption
    fontFamily: fontDisplay,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: lightText, // was lightText
  );
}
