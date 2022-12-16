import 'package:flutter/material.dart';
import 'package:flutter_receipt_app/src/page/pages.dart';

class Auth extends StatefulWidget {
  static const routeName = '/';

  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () => _navToHome());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  void _navToHome() {
    Navigator.of(context).popUntil((route) => route.isFirst);

    Navigator.of(context).pushReplacementNamed(Home.routeName);
  }
}
