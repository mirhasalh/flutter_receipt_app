import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_receipt_app/src/assets/fonts.dart';
import 'package:flutter_receipt_app/src/palette.dart';

ThemeData kTheme = ThemeData(
  // This is the theme of your application.
  //
  // Try running your application with "flutter run". You'll see the
  // application has a blue toolbar. Then, without quitting the app, try
  // changing the primarySwatch below to Colors.green and then invoke
  // "hot reload" (press "r" in the console where you ran "flutter run",
  // or simply save your changes to "hot reload" in a Flutter IDE).
  // Notice that the counter didn't reset back to zero; the application
  // is not restarted.
  primarySwatch: Colors.teal,
  fontFamily: Fonts.inter,
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
  }),
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ),
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Palette.slateGray),
    titleTextStyle: TextStyle(
      color: Palette.eerieBlack,
      fontSize: 20.0,
    ),
    elevation: 0.0,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: Palette.eerieBlack),
    bodyText2: TextStyle(color: Palette.eerieBlack),
  ),
  dividerTheme: const DividerThemeData(
    color: Palette.cultured,
    thickness: 0.6,
  ),
);
