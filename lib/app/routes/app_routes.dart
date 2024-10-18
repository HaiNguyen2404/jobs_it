import 'package:flutter/material.dart';
import 'package:jobs_it/features/authentication/presentation/pages/register_page.dart';
import 'package:jobs_it/features/authentication/presentation/pages/sign_in_page.dart';
import 'package:jobs_it/features/job_view/presentation/pages/applied_page.dart';
import 'package:jobs_it/features/job_view/presentation/pages/change_password_page.dart';
import 'package:jobs_it/features/job_view/presentation/pages/home_initial_page.dart';
import 'package:jobs_it/features/job_view/presentation/pages/homepage.dart';
import 'package:jobs_it/features/job_view/presentation/pages/job_info_edit_page.dart';
import 'package:jobs_it/features/job_view/presentation/pages/personal_info_edit_page.dart';

class AppRoutes {
  static const String homePage = '/home_page';
  static const String homeInitialPage = '/home_initial_page';
  static const String appliedPage = '/applied_page';
  static const String personalInfoEditPage = '/personal_info_edit_page';
  static const String jobInfoEditPage = '/job_info_edit_page';
  static const String signInPage = '/sign_in_page';
  static const String registerPage = '/register_page';

  static const String changePasswordPage = '/change_password_page';

  static Map<String, WidgetBuilder> routes = {
    homePage: (context) => const Homepage(),
    homeInitialPage: (context) => const HomeInitialPage(),
    appliedPage: (context) => const AppliedPage(),
    personalInfoEditPage: (context) => PersonalInfoEditPage(),
    jobInfoEditPage: (context) => JobInfoEditPage(),
    signInPage: (context) => const SignInPage(),
    registerPage: (context) => RegisterPage(),
    changePasswordPage: (context) => ChangePasswordPage(),
  };
}
