import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_receipt_app/src/assets/svgs.dart';
import 'package:flutter_receipt_app/src/page/pages.dart';
import 'package:flutter_receipt_app/src/palette.dart';
import 'package:flutter_svg/svg.dart';

class AuthPage extends StatefulWidget {
  static const routeName = '/';

  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          systemNavigationBarColor: _getSystemNavigationBarColor(
              MediaQuery.of(context).platformBrightness),
        ),
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

  Color _getSystemNavigationBarColor(Brightness brightness) {
    switch (brightness) {
      case Brightness.dark:
        return Palette.charcoal;
      case Brightness.light:
        return Colors.white;
      default:
        return Colors.white;
    }
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
