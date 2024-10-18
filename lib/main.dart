import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_it/app/di/service_locator.dart' as di;
import 'package:jobs_it/app/routes/app_routes.dart';
import 'package:jobs_it/app/theme/app_colors.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jobs_it/features/authentication/presentation/bloc/button_cubit.dart';
import 'package:jobs_it/features/authentication/presentation/pages/sign_in_page.dart';
import 'package:jobs_it/features/job_view/presentation/bloc/applied_jobs_cubit.dart';
import 'package:jobs_it/features/job_view/presentation/bloc/homepage_cubit.dart';
import 'package:jobs_it/features/job_view/presentation/bloc/saved_jobs_cubit.dart';

void main() async {
  di.initServiceLocator();
  await Hive.initFlutter();
  await Hive.openBox('credentialsBox');

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => di.locator<ButtonCubit>()),
      BlocProvider(create: (context) => di.locator<HomepageCubit>()),
      BlocProvider(create: (context) => di.locator<SavedJobsCubit>()),
      BlocProvider(create: (context) => di.locator<AppliedJobsCubit>()),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: AppColors.background),
      home: const SignInPage(),
      routes: AppRoutes.routes,
    );
  }
}
