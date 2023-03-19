import 'package:flutter/material.dart';
import 'package:meetus/ui/pages/sign_in_page.dart';
import 'package:meetus/ui/pages/splash_screen_page.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SignInPage(),
        'sign-in': (context) => SignInPage()
      },
    );
  }
}
