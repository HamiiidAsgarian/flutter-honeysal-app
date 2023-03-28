import 'package:bakery/consts.dart';
import 'package:bakery/view/screens/checkout_screen.dart';
import 'package:bakery/view/screens/login_screen.dart';
import 'package:bakery/view/widgets/app_bar.dart';
import 'package:bakery/view/widgets/vertical_card.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../core/utilities.dart';
import '../../core/validator.dart';
import '../../services/app_start_data.dart';
import '../widgets/mobile_text_input.dart';

class SignUpScreen extends StatefulWidget {
  static String route = "/SignUpScreen";

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String selectedPhoneCode = "+98";
  final TextEditingController _phoneInputController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
              vertical: 20, horizontal: AppConst.appHorizontalPadding),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text("Create account", style: AppConst.detailPriceStyle),
            const Text("Sign up to continue",
                style: AppConst.productSubtitleStyle),
            const SizedBox(height: 10),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextInput(
                        title: 'Email',
                        hint: "Enter your email",
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) => Validators.emailValidator(value)),
                    const SizedBox(height: 20),
                    MobileTextInput(
                      selectedPhoneCode: selectedPhoneCode,
                      onSelected: (String selected) {
                        setState(() {
                          selectedPhoneCode = selected;
                        });
                      },
                      phoneInputController: _phoneInputController,
                      validator: (String? value) =>
                          Validators.phoneNumberValidator(value),
                    ),
                    const SizedBox(height: 20),
                    CustomTextInput(
                        title: 'Password',
                        hint: "Enter your password",
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) =>
                            Validators.passwordValidator(value)),
                  ],
                )),

            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "• At least 8 characters",
                  style: AppConst.smallTextStyle
                      .copyWith(color: AppConst.mainGreen),
                ),
                Text(
                  "• Include special characters",
                  style: AppConst.smallTextStyle
                      .copyWith(color: AppConst.mainGreen),
                ),
                Text(
                  "• Include upper and lower cases",
                  style: AppConst.smallTextStyle
                      .copyWith(color: AppConst.mainGreen),
                ),
                Text(
                  "• Include numbers",
                  style: AppConst.smallTextStyle
                      .copyWith(color: AppConst.mainGreen),
                ),
              ],
            ),
            const SizedBox(height: 50),

            Text.rich(TextSpan(children: [
              const TextSpan(
                  text: "By Continuing you agree to our ",
                  style: AppConst.smallTextStyle),
              TextSpan(
                  text: "terms of service",
                  style: AppConst.smallTextStyle
                      .copyWith(color: AppConst.burnedOrange),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      //on tap code here, you can navigate to other page or URL
                    }),
              const TextSpan(text: " and ", style: AppConst.smallTextStyle),
              TextSpan(
                  text: " Privacy Policy",
                  style: AppConst.smallTextStyle
                      .copyWith(color: AppConst.burnedOrange),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      //on tap code here, you can navigate to other page or URL
                    })
            ])),

            const SizedBox(height: 20),
            MainButton(
                onPress: () {
                  if (_formKey.currentState!.validate()) {
                    showLoadingDialogPanel(context, "Sending data");
                    signUpDataPost(true).then((value) {
                      if (value["status"] == 200) {
                        Navigator.pop(context);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const LoginScreen())));
                      } else {
                        Navigator.pop(context);
                        // showLoadingDialogPanel(context, "Login failed");
                      }
                    });
                  }
                },
                title: "Create account"),
            const SizedBox(height: 20),

            Center(
              child: Text.rich(TextSpan(children: [
                const TextSpan(
                    text: "Already have an account? ",
                    style: AppConst.smallTextStyle),
                TextSpan(
                    text: "Log In",
                    style: AppConst.smallTextStyle
                        .copyWith(color: AppConst.burnedOrange),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const LoginScreen())));
                      }),
              ])),
            ),
            // const SizedBox(height: 20),
          ])),
    );
  }
}
