import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meetus/shared/theme.dart';
import 'package:meetus/ui/widgets/navigation/bottom_navigation_item.dart';

import 'home_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    final topPadding = MediaQuery.of(context).padding.top;

    Widget buildContent(double topPadding) {
      return HomePage(
        topPadding: topPadding,
        bottomPadding: bottomPadding,
      );
    }

    Widget customButtonNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: bottomPadding + 65,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 7,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottomNavigationItem(
                    icon: 'assets/icon/ic_explore.svg', title: 'Explore'),
                BottomNavigationItem(
                    icon: 'assets/icon/ic_document.svg', title: 'List'),
                BottomNavigationItem(
                    icon: 'assets/icon/ic_profile.svg', title: 'Profile'),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Stack(
        children: [
          buildContent(topPadding),
          customButtonNavigation(),
        ],
      ),
    );
  }
}
