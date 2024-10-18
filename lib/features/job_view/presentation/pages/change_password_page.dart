import 'package:flutter/material.dart';
import 'package:jobs_it/app/routes/app_routes.dart';
import 'package:jobs_it/app/theme/app_styles.dart';
import 'package:jobs_it/app/widgets/custom_button.dart';
import 'package:jobs_it/app/widgets/custom_text_form_field.dart';

class ChangePasswordPage extends StatelessWidget {
  ChangePasswordPage({super.key});

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(
                  left: 22,
                  top: 208,
                  right: 33,
                ),
                child: Column(
                  children: [
                    const Text('Change Password', style: AppStyles.titleLarge),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: CustomTextFormField(
                        controller: passwordController,
                        hintText: 'Password',
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.visiblePassword,
                        obscureText: true,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: CustomTextFormField(
                        controller: newPasswordController,
                        hintText: 'New Password',
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.visiblePassword,
                        obscureText: true,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: CustomTextFormField(
                        controller: confirmPasswordController,
                        hintText: 'Confirm New Password',
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.visiblePassword,
                        obscureText: true,
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      text: 'Change',
                      margin: const EdgeInsets.only(left: 2),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const SizedBox(height: 26),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(
                          AppRoutes.signInPage,
                        );
                      },
                      child: const Text(
                        'Return to Sign In',
                        style: AppStyles.bodySmallBold11,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
