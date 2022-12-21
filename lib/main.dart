import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_receipt_app/src/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const ProviderScope(child: App()));
}
