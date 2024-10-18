import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_it/app/routes/app_routes.dart';
import 'package:jobs_it/app/theme/app_styles.dart';
import 'package:jobs_it/app/widgets/custom_button.dart';
import 'package:jobs_it/app/widgets/custom_checkbox.dart';
import 'package:jobs_it/app/widgets/custom_icon_button.dart';
import 'package:jobs_it/app/widgets/custom_text_form_field.dart';
import 'package:jobs_it/features/authentication/data/models/credentials.dart';
import 'package:jobs_it/features/authentication/data/models/sign_in_request.dart';
import 'package:jobs_it/features/authentication/presentation/bloc/button_cubit.dart';
import 'package:jobs_it/features/authentication/presentation/pages/forgot_password_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool savePassword = true;

  String? savedUsername;
  String? savedPassword;

  @override
  void initState() {
    super.initState();
    _loadCredentials();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                  SizedBox(
                    width: 200,
                    child: Image.asset(
                      'lib/app/images/app_logo.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  const SizedBox(height: 102),
                  _buildEmailPasswordFields(),
                  const SizedBox(height: 20),
                  _buildPasswordOptions(),
                  const SizedBox(height: 20),
                  BlocListener<ButtonCubit, ButtonState>(
                    listener: (context, state) {
                      if (state is ButtonSuccessState) {
                        if (savePassword) {
                          _saveCredentials();
                        } else {
                          _deleteCredentials();
                        }
                        Navigator.of(context)
                            .pushReplacementNamed(AppRoutes.homePage);
                        TextInput.finishAutofillContext();
                      } else if (state is ButtonFailureState) {
                        SnackBar snackBar = SnackBar(
                          content: Text(
                            state.errorMessage,
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: CustomButton(
                      onPressed: () {
                        signIn();
                      },
                      text: 'Sign In',
                      margin: const EdgeInsets.only(right: 4),
                      buttonStyle: const ButtonStyle(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Or Sign In With',
                    style: AppStyles.bodySmall11,
                  ),
                  const SizedBox(height: 20),
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
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Don't have an Account?",
                        style: AppStyles.bodySmall11,
                      ),
                      TextButton(
                        child: const Text(
                          'Sign Up',
                          style: AppStyles.bodySmallBold11,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed(
                            AppRoutes.registerPage,
                          );
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

  Widget _buildEmailPasswordFields() {
    return SizedBox(
      width: double.maxFinite,
      child: AutofillGroup(
        child: Column(
          children: [
            CustomTextFormField(
              controller: emailController,
              hintText: 'Email',
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.text,
              autofillHints: const [AutofillHints.username],
            ),
            const SizedBox(height: 24),
            CustomTextFormField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.visiblePassword,
              autofillHints: const [AutofillHints.password],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordOptions() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomCheckbox(
            text: "Save Password",
            value: savePassword,
            onChanged: (value) {
              setState(() {
                savePassword = value!;
              });
            },
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => ForgotPasswordPage()));
            },
            child: const Text(
              "Forgot Password",
              style: AppStyles.bodySmall11,
            ),
          ),
        ],
      ),
    );
  }

  signIn() {
    context.read<ButtonCubit>().signIn(
          SignInRequest(
            username: emailController.text,
            password: passwordController.text,
          ),
        );
  }

  _loadCredentials() async {
    final credentials = await context.read<ButtonCubit>().getCredentials();
    if (credentials != null) {
      setState(() {
        emailController.text = credentials.username;
        passwordController.text = credentials.password;
      });
    }
  }

  _saveCredentials() {
    final credentials = Credentials(
      username: emailController.text,
      password: passwordController.text,
    );

    context.read<ButtonCubit>().saveCredentials(credentials);
  }

  _deleteCredentials() {
    context.read<ButtonCubit>().deleteCredentials();
  }
}
