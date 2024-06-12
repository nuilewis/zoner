import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:zoner/core/core.dart';
import 'package:zoner/screens/auth/auth.dart';
import 'package:zoner/screens/components_global/components.dart';

import '../components_global/bottom_nav_bar.dart';

class SignInScreen extends StatefulWidget {
  static const String id = "sign_in";
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    // final bool isDarkMode = theme.brightness == Brightness.dark;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPadding16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ZonerAppBar(pageTitle: "Sign in"),
              const Text("Email"),
              const Gap(kPadding8),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: ZonerInputDecoration.inputDecoration(context)
                    .copyWith(hintText: "Email"),
                validator: (value) {
                  ///Todo: probably find a better regex for validating emails
                  if (value == null || value.isEmpty) {
                    return "Please input an email";
                  }
                  if (!value.contains("@")) {
                    return "Please input a valid email";
                  } else {
                    return null;
                  }
                },
              ),
              const Gap(kPadding16),
              const Text("Password"),
              const Gap(kPadding8),
              TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: _obscureText,
                decoration:
                    ZonerInputDecoration.inputDecoration(context).copyWith(
                        hintText: "Password",
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            icon: Icon(
                              _obscureText
                                  ? FluentIcons.eye_24_regular
                                  : FluentIcons.eye_off_24_regular,
                              color: theme.colorScheme.primary,
                            ))),
                validator: (value) {
                  ///Todo: probably find a better regex for validating emails
                  if (value == null || value.isEmpty) {
                    return "Please input a password";
                  }
                  if (value.length < 8) {
                    return "Your password cannot be less than 8 characters";
                  } else {
                    return null;
                  }
                },
              ),
              const Spacer(),
              ZonerButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      //Todo: perform sign in

                      context.pushReplacementNamed(BottomNavBar.id);
                    }

                    /// Just go to patient home page for now
                  },
                  label: "Sign in"),
              const Gap(kPadding16),
              ZonerButton(
                iconPath: "assets/svg/google.svg",
                onPressed: () {},
                label: "Continue With Google",
                buttonType: AppButtonType.secondary,
              ),
              const Gap(kPadding16),
              const Align(alignment: Alignment.center, child: Text("or")),
              Align(
                alignment: Alignment.center,
                child: FittedBox(
                  child: ZonerButton(
                    onPressed: () {
                      context.pushNamed(RegisterScreen.id);
                    },
                    buttonType: AppButtonType.text,
                    label: "Create an Account",
                  ),
                ),
              ),
              const Gap(kPadding32)
            ],
          ),
        ),
      ),
    );
  }
}
