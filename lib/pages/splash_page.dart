import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  // Exposes a static Route which makes it very easy to navigate to via Navigator.of(context).push(SplashPage.route());
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => SplashPage());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
