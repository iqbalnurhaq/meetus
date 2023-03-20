import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../shared/theme.dart';
import '../widgets/card/home_popular_card.dart';

class HomePage extends StatelessWidget {
  final double topPadding;
  const HomePage({
    super.key,
    this.topPadding = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(color: kGreenColor),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: topPadding + 95,
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: topPadding + 95,
                    decoration: BoxDecoration(
                      color: kGreenColor,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(28),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: topPadding + 12,
                        left: 20,
                        right: 20,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hi, Iqbal',
                                  style: whiteTextStyle.copyWith(fontSize: 24),
                                ),
                                Text(
                                  "Let's start meet!",
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: kBlackColor.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              Container(
                                width: 24,
                                height: 24,
                                child: SvgPicture.asset(
                                  'assets/icon/ic_heart.svg',
                                  color: kWhiteColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: kBlackColor.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              Container(
                                width: 24,
                                height: 24,
                                child: SvgPicture.asset(
                                  'assets/icon/ic_notification.svg',
                                  color: kWhiteColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(color: kWhiteColor),
                padding: EdgeInsets.only(top: 32),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Popular Meet',
                            style: blackTextStyle.copyWith(fontSize: 18),
                          ),
                          Text(
                            'See All',
                            style: greenTextStyle,
                          )
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(top: 16, bottom: 16, left: 20),
                      child: Row(
                        children: [
                          HomePopularCard(),
                          HomePopularCard(),
                          HomePopularCard(),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
