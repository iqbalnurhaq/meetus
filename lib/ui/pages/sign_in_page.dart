import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meetus/shared/theme.dart';

class SignInPage extends StatefulWidget {
  SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final FocusNode emailFocus = FocusNode();
  final TextEditingController emailController = TextEditingController(text: '');

  final FocusNode passwordFocus = FocusNode();
  final TextEditingController passwordController =
      TextEditingController(text: '');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailFocus.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    print("Focus: ${emailFocus.hasPrimaryFocus}");
  }

  Widget title() {
    return Container(
      padding: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome back',
            style: blackTextStyle.copyWith(
              fontSize: 24,
              fontWeight: semiBold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 24),
            child: Text(
              'Login to your right account to continue and find the meeting you want.',
              style: grayTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget logo() {
    return Container(
      padding: EdgeInsets.only(bottom: 42),
      child: SvgPicture.asset(
        'assets/icon/logo.svg',
        color: kGreenColor,
      ),
    );
  }

  Widget textInputField() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: emailController,
            style: blackTextStyle.copyWith(fontSize: 16),
            focusNode: emailFocus,
            decoration: InputDecoration(
              hintText: "Email",
              hintStyle: grayTextStyle.copyWith(fontSize: 16),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: kGrayColor,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xff1C82AD),
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              prefixIcon: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icon/ic_email.svg',
                  color: emailFocus.hasFocus ? kGreenColor : kGrayColor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          TextField(
            controller: passwordController,
            style: blackTextStyle.copyWith(fontSize: 16),
            focusNode: passwordFocus,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Password",
              hintStyle: grayTextStyle.copyWith(fontSize: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xff1C82AD),
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              prefixIcon: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/icon/ic_password.svg',
                    color: Color(0xff1C82AD)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget submitButton() {
    return Container(
      width: double.infinity,
      height: 55,
      margin: EdgeInsets.only(top: 24),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: kGreenColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {},
        child: Text(
          'Sign In',
          style: whiteTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
      ),
    );
  }

  Widget termCondition() {
    return Container(
      margin: EdgeInsets.only(top: 32),
      child: Text(
        'By continuing, you agree to our Terms & Conditions and Privacy Policy',
        style: grayTextStyle.copyWith(fontSize: 16),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget signUpText() {
    return Container(
      margin: EdgeInsets.only(top: 50, bottom: 40),
      child: Text(
        'I already have an account',
        style: greenTextStyle.copyWith(fontSize: 16),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          children: [
            title(),
            logo(),
            textInputField(),
            submitButton(),
            termCondition(),
            signUpText(),
          ],
        ),
      ),
    );
  }
}
