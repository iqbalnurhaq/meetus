import 'package:flutter/material.dart';

import '../../../shared/theme.dart';

class HomeCategoryCard extends StatelessWidget {
  final String icon;
  final String name;

  const HomeCategoryCard({
    super.key,
    required this.icon,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: kBlackColor.withOpacity(0.08),
            blurRadius: 12,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(icon),
              ),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            name,
            style: grayTextStyle,
          )
        ],
      ),
    );
  }
}
