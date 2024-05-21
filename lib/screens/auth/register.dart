import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zoner/core/core.dart';
import 'package:zoner/screens/components_global/components.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = "register";
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool _obscurePasswordField = true;
  bool _obscureConfirmPasswordField = true;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    // final bool isDarkMode = theme.brightness == Brightness.dark;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const ZonerAppBar(pageTitle: "Register"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
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
                    obscureText: _obscurePasswordField,
                    decoration:
                        ZonerInputDecoration.inputDecoration(context).copyWith(
                            hintText: "Password",
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _obscurePasswordField =
                                        !_obscurePasswordField;
                                  });
                                },
                                icon: Icon(
                                  _obscurePasswordField
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
                  const Gap(kPadding16),
                  const Text("Confirm Password"),
                  const Gap(kPadding8),
                  TextFormField(
                    controller: confirmPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _obscureConfirmPasswordField,
                    decoration:
                        ZonerInputDecoration.inputDecoration(context).copyWith(
                            hintText: "Confirm Password",
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _obscureConfirmPasswordField =
                                        !_obscureConfirmPasswordField;
                                  });
                                },
                                icon: Icon(
                                  _obscureConfirmPasswordField
                                      ? FluentIcons.eye_24_regular
                                      : FluentIcons.eye_off_24_regular,
                                  color: theme.colorScheme.primary,
                                ))),
                    validator: (value) {
                      ///Todo: probably find a better regex for validating emails
                      if (value == null || value.isEmpty) {
                        return "Please input a password";
                      }
                      if (value.trim() != passwordController.text.trim()) {
                        return "Password does not match";
                      } else {
                        return null;
                      }
                    },
                  )
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ZonerButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          //Todo: perform sign in
                        }
                      },
                      label: "Create Account"),
                  const Gap(kPadding16),
                  ZonerButton(
                    iconPath: "assets/svg/google.svg",
                    onPressed: () {},
                    label: "Continue With Google",
                    buttonType: AppButtonType.secondary,
                  ),
                  const Gap(kPadding8),
                  const Text("or"),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Sign In",
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: theme.colorScheme.primary),
                    ),
                  ),
                  const Gap(kPadding64),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
