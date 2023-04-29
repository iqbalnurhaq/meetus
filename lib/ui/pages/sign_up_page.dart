import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meetus/provider/auth_notifier.dart';
import 'package:meetus/shared/theme.dart';
import 'package:meetus/ui/widgets/input/input_text_field.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FocusNode nameFocus = FocusNode();
  final TextEditingController nameController = TextEditingController(text: '');

  final FocusNode emailFocus = FocusNode();
  final TextEditingController emailController = TextEditingController(text: '');

  final FocusNode passwordFocus = FocusNode();
  final TextEditingController passwordController =
      TextEditingController(text: '');

  final FocusNode professionFocus = FocusNode();
  final TextEditingController professionController =
      TextEditingController(text: '');

  @override
  void initState() {
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
            'Sign Up',
            style: blackTextStyle.copyWith(
              fontSize: 24,
              fontWeight: semiBold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 24),
            child: Text(
              'Regiter yorself and find the meeting you want.',
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
          InputTextField(
            title: 'Name',
            icon: 'assets/icon/ic_user.svg',
            textController: nameController,
            focusNode: nameFocus,
          ),
          SizedBox(
            height: 16,
          ),
          InputTextField(
            title: 'Email',
            icon: 'assets/icon/ic_email.svg',
            textController: emailController,
            focusNode: emailFocus,
          ),
          SizedBox(
            height: 16,
          ),
          InputTextField(
            title: 'Password',
            icon: 'assets/icon/ic_password.svg',
            textController: passwordController,
            focusNode: passwordFocus,
            obscure: true,
          ),
          SizedBox(
            height: 16,
          ),
          InputTextField(
            title: 'Profession (Optional)',
            icon: 'assets/icon/ic_bag.svg',
            textController: professionController,
            focusNode: professionFocus,
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
        onPressed: () {
          var body = {
            "name": nameController.text,
            "email": emailController.text,
            "password": passwordController.text,
            "profession": professionController.text,
          };
          Provider.of<AuthNotifier>(context, listen: false).authRegister(body);
        },
        child: Text(
          'Sign Up',
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
    final topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          SizedBox(
            height: topPadding,
          ),
          title(),
          textInputField(),
          submitButton(),
          signUpText(),
        ],
      ),
    );
  }
}
