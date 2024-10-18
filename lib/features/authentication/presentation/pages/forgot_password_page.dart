import 'package:flutter/material.dart';
import 'package:jobs_it/app/theme/app_styles.dart';
import 'package:jobs_it/app/widgets/custom_button.dart';
import 'package:jobs_it/app/widgets/custom_text_form_field.dart';
import 'package:jobs_it/features/authentication/presentation/pages/reset_password_page.dart';
import 'package:jobs_it/features/authentication/presentation/pages/sign_in_page.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  final TextEditingController emailController = TextEditingController();

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
                    const Text('Forgot Password', style: AppStyles.titleLarge),
                    const SizedBox(height: 10),
                    const Text(
                      'Please enter your Registered Email\nWe will send a link to reset your password',
                      style: AppStyles.bodySmall11,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: CustomTextFormField(
                        controller: emailController,
                        hintText: 'Email',
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.emailAddress,
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      text: 'Send',
                      margin: const EdgeInsets.only(left: 2),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => ResetPasswordPage()));
                      },
                    ),
                    const SizedBox(height: 26),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const SignInPage()));
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
