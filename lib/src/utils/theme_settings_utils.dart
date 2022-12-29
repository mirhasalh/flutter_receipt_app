import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_receipt_app/src/palette.dart';

class ThemeSettingsUtils {
  void setSystemNavigationBarColor({
    required BuildContext context,
    required ThemeMode themeMode,
  }) {
    switch (themeMode) {
      case ThemeMode.dark:
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            systemNavigationBarColor: Palette.charcoal,
          ),
        );
        return;
      case ThemeMode.light:
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.white,
          ),
        );
        return;
      default:
        final brightness = MediaQuery.of(context).platformBrightness;
        if (brightness == Brightness.dark) {
          SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(
              systemNavigationBarColor: Palette.charcoal,
            ),
          );
        } else {
          SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(
              systemNavigationBarColor: Colors.white,
            ),
          );
        }
        return;
    }
  }
}
