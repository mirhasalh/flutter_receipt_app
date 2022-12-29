import 'package:flutter/material.dart';
import 'package:flutter_receipt_app/src/assets/svgs.dart';
import 'package:flutter_receipt_app/src/page/pages.dart';
import 'package:flutter_receipt_app/src/palette.dart';
import 'package:flutter_receipt_app/src/provider/theme_provider.dart';
import 'package:flutter_receipt_app/src/utils/theme_settings_utils.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthPage extends ConsumerStatefulWidget {
  static const routeName = '/';

  const AuthPage({super.key});

  @override
  AuthPageState createState() => AuthPageState();
}

class AuthPageState extends ConsumerState<AuthPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final themeMode = ref.watch(themeProvider).themeMode;

      ThemeSettingsUtils().setSystemNavigationBarColor(
        context: context,
        themeMode: themeMode,
      );
    });

    Future.delayed(const Duration(seconds: 3), () => _navToHome());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          _getBackgroundColor(MediaQuery.of(context).platformBrightness),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Version 0.0.0 (0)',
              style: Theme.of(context).textTheme.caption,
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Palette.naplesYellow,
                    Palette.naplesYellow,
                    Palette.maximumYellowRed,
                  ],
                ),
              ),
              child: SvgPicture.asset(
                Svgs.icon,
                width: 40,
                color: Colors.white,
              ),
            ),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }

  void _navToHome() {
    Navigator.of(context).popUntil((route) => route.isFirst);

    Navigator.of(context).pushReplacementNamed(DocumentPage.routeName);
  }

  Color _getBackgroundColor(Brightness brightness) {
    switch (brightness) {
      case Brightness.dark:
        return Palette.charcoal;
      case Brightness.light:
        return Colors.white;
      default:
        return Colors.white;
    }
  }
}
