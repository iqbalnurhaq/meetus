import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
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
