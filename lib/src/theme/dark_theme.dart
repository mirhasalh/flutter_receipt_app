import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_receipt_app/src/palette.dart';

final kDarkTheme = ThemeData.dark(useMaterial3: false).copyWith(
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
    ),
    backgroundColor: Palette.charcoal,
    iconTheme: IconThemeData(color: Palette.silverSand),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    elevation: 0.0,
  ),
  listTileTheme: const ListTileThemeData(
    textColor: Colors.white,
    tileColor: Palette.gunmetal,
  ),
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
  }),
  scaffoldBackgroundColor: Palette.charlestonGreen,
);
