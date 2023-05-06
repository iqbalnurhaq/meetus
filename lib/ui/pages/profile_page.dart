import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:meetus/shared/theme.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    Widget headerProfile() {
      return Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/img_default_profile.png'),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Iqbal Nur Haq',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'iqbalnur833@gmail.com',
                  style: grayTextStyle.copyWith(fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              Container(
                width: 14,
                height: 14,
                child: SvgPicture.asset('assets/icon/ic_edit_profile.svg'),
              ),
            ],
          ),
        ],
      );
    }

    Widget profileListItem(String title, String icon) {
      return Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 13,
                    height: 15,
                    child: SvgPicture.asset(icon),
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  Expanded(
                    child: Text(
                      title,
                      style: blackTextStyle,
                    ),
                  ),
                  Container(
                    width: 16,
                    height: 10,
                    child: SvgPicture.asset('assets/icon/ic_right_arrow.svg'),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: topPadding,
        ),
        children: [
          Text(
            'Profile',
            style: blackTextStyle.copyWith(
              fontSize: 24,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          headerProfile(),
          SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Account',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    profileListItem(
                        'Notification', 'assets/icon/ic_profile_notif.svg'),
                    profileListItem(
                        'Change Password', 'assets/icon/ic_change_pass.svg'),
                    profileListItem(
                        'Email preference', 'assets/icon/ic_email.svg')
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                'Meet',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    profileListItem(
                        'Certificate', 'assets/icon/ic_certificate.svg'),
                    profileListItem('Payment', 'assets/icon/ic_payment.svg'),
                    profileListItem('History', 'assets/icon/ic_history.svg')
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                'Support',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    profileListItem('Help', 'assets/icon/ic_star.svg'),
                    profileListItem('FAQ', 'assets/icon/ic_faq.svg'),
                  ],
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Sign Out',
                  style: redTextStyle.copyWith(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: bottomPadding + 90,
              ),
            ],
          )
        ],
      ),
    );
  }
}
