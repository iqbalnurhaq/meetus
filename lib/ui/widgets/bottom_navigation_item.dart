import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../shared/theme.dart';

class BottomNavigationItem extends StatelessWidget {
  final String icon;
  final String title;
  const BottomNavigationItem({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 25,
          height: 25,
          child: SvgPicture.asset(
            icon,
            color: kGrayColor,
          ),
        ),
        SizedBox(height: 5),
        Text(
          title,
          style: grayTextStyle.copyWith(fontSize: 14),
        )
      ],
    );
  }
}
