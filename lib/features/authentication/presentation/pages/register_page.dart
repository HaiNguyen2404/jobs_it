import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_it/app/theme/app_styles.dart';
import 'package:jobs_it/app/widgets/custom_button.dart';
import 'package:jobs_it/features/authentication/data/models/register_request.dart';
import 'package:jobs_it/features/authentication/presentation/bloc/button_cubit.dart';
import '../../../../app/routes/app_routes.dart';
import '../../../../app/widgets/custom_icon_button.dart';
import '../../../../app/widgets/custom_text_form_field.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.all(18),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 8),
                  const Text(
                    'Register',
                    style: AppStyles.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  _buildRegisterFields(),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.maxFinite,
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "By click the Register button, I agree to the ",
                            style: AppStyles.bodySmall11,
                          ),
                          TextSpan(
                            text: "Terms of Use",
                            style: AppStyles.bodySmallBold11,
                          ),
                          TextSpan(
                            text: " and ",
                            style: AppStyles.bodySmall11,
                          ),
                          TextSpan(
                            text: "Privacy Policy of Jobsit.vn",
                            style: AppStyles.bodySmallBold11,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 14),
                  BlocListener<ButtonCubit, ButtonState>(
                    listener: (context, state) {
                      if (state is ButtonSuccessState) {
                        Navigator.of(context)
                            .pushReplacementNamed(AppRoutes.homePage);
                      } else if (state is ButtonFailureState) {
                        var snackBar =
                            SnackBar(content: Text(state.errorMessage));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: CustomButton(
                      text: 'Register',
                      onPressed: () {
                        _register(context);
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Or Continue With',
                    style: AppStyles.bodySmall11,
                  ),
                  const SizedBox(height: 14),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomIconButton(
                        image: AssetImage('lib/app/images/google_icon.png'),
                      ),
                      SizedBox(width: 20),
                      CustomIconButton(
                        image: AssetImage('lib/app/images/fb_icon.png'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Already had an Account?',
                        style: AppStyles.bodySmall11,
                      ),
                      TextButton(
                        child: const Text(
                          'Sign In',
                          style: AppStyles.bodySmallBold11,
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(AppRoutes.signInPage);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterFields() {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 2),
            child: CustomTextFormField(
              controller: firstNameController,
              hintText: 'First Name',
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.text,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 2),
            child: CustomTextFormField(
              controller: lastNameController,
              hintText: 'Last Name',
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.text,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 2),
            child: CustomTextFormField(
              controller: emailController,
              hintText: 'Email',
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.text,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 2),
            child: CustomTextFormField(
              controller: passwordController,
              hintText: 'Password',
              textInputAction: TextInputAction.done,
              obscureText: true,
              textInputType: TextInputType.visiblePassword,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 2),
            child: CustomTextFormField(
              controller: confirmPasswordController,
              hintText: 'Confirm Password',
              textInputAction: TextInputAction.done,
              obscureText: true,
              textInputType: TextInputType.visiblePassword,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 2),
            child: CustomTextFormField(
              controller: phoneController,
              hintText: 'Phone',
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.text,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  _register(BuildContext context) async {
    RegisterRequest request = RegisterRequest(
      name: firstNameController.text,
      username: emailController.text,
      password: passwordController.text,
    );
    await context.read<ButtonCubit>().register(request);
  }
}
