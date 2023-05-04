import 'package:flutter/material.dart';
import 'package:meetus/provider/auth_notifier.dart';
import 'package:meetus/provider/bottom_navigation_notifier.dart';
import 'package:meetus/ui/pages/main_page.dart';
import 'package:meetus/ui/pages/sign_in_page.dart';
import 'package:meetus/ui/pages/sign_up_page.dart';
import 'package:meetus/ui/pages/splash_screen_page.dart';
import 'package:provider/provider.dart';
import 'package:meetus/injection.dart' as di;

void main() async {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => di.locator<AuthNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => BottomNavigationNotifier(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashScreenPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/main': (context) => MainPage(),
        },
      ),
    );
  }
}
