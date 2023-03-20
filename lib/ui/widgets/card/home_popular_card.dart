import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared/theme.dart';

class HomePopularCard extends StatelessWidget {
  const HomePopularCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      height: 240,
      margin: EdgeInsets.only(right: 24),
      decoration: BoxDecoration(
        color: kWhiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 7,
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/img_popular_default.png',
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Design Thingking Fundamental',
                  style: blackTextStyle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      child: SvgPicture.asset(
                        'assets/icon/ic_location.svg',
                        color: kGrayColor,
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      'Jakarta Selatan',
                      style: grayTextStyle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'FREE',
                  style: greenTextStyle,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
