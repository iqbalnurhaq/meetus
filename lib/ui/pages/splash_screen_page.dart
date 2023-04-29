import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meetus/shared/shared_preference.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  SharedPref sharedPref = SharedPref();
  void initState() {
    Timer(Duration(seconds: 3), () async {
      String token = await sharedPref.readString("token");
      if (token != "") {
        Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, '/sign-in', (route) => false);
      }
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff26C165),
      body: Center(
        child: Container(
          child: SvgPicture.asset('assets/icon/logo.svg'),
        ),
      ),
    );
  }
}
