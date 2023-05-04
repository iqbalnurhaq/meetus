import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meetus/provider/bottom_navigation_notifier.dart';
import 'package:provider/provider.dart';

import '../../../shared/theme.dart';

class BottomNavigationItem extends StatelessWidget {
  final String icon;
  final String title;
  final int keySlc;
  final Function() onTap;

  const BottomNavigationItem({
    super.key,
    required this.icon,
    required this.title,
    required this.keySlc,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Consumer<BottomNavigationNotifier>(
        builder: (context, data, child) {
          return Column(
            children: [
              Container(
                width: 25,
                height: 25,
                child: SvgPicture.asset(
                  icon,
                  color: data.selectNav == keySlc ? kGreenColor : kGrayColor,
                ),
              ),
              SizedBox(height: 5),
              Text(
                title,
                style: grayTextStyle.copyWith(fontSize: 14),
              )
            ],
          );
        },
      ),
    );
  }
}
