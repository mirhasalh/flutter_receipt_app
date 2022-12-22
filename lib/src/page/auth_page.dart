import 'package:flutter/material.dart';
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

    Future.delayed(const Duration(seconds: 3), () => _navToHome());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              decoration: BoxDecoration(
                color: Palette.naplesYellow,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Palette.maximumYellowRed,
                  width: 2.5,
                ),
              ),
              child: SvgPicture.asset(
                Svgs.icon,
                width: 38.0,
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
}