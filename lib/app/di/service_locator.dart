import 'package:get_it/get_it.dart';
import 'package:jobs_it/app/network/dio_client.dart';
import 'package:jobs_it/features/authentication/data/data_source/auth_api_service.dart';
import 'package:jobs_it/features/authentication/data/data_source/hive_credentials_storage.dart';
import 'package:jobs_it/features/authentication/domain/repository/auth_repository.dart';
import 'package:jobs_it/features/authentication/domain/usecases/auth_use_cases.dart';
import 'package:jobs_it/features/authentication/domain/usecases/credentials_use_cases.dart';
import 'package:jobs_it/features/authentication/presentation/bloc/button_cubit.dart';
import 'package:jobs_it/features/job_view/data/data_source/job_data_source.dart';
import 'package:jobs_it/features/job_view/data/repository/jobs_repository_impl.dart';
import 'package:jobs_it/features/job_view/domain/repositories/jobs_repository.dart';
import 'package:jobs_it/features/job_view/domain/use_cases/jobs_use_case.dart';
import 'package:jobs_it/features/job_view/presentation/bloc/applied_jobs_cubit.dart';
import 'package:jobs_it/features/job_view/presentation/bloc/homepage_cubit.dart';
import 'package:jobs_it/features/job_view/presentation/bloc/saved_jobs_cubit.dart';

import '../../features/authentication/data/repository/auth_repository_impl.dart';

final locator = GetIt.instance;

void initServiceLocator() {
  // Auth feature
  locator.registerFactory(() => ButtonCubit(
        locator<RegisterUseCase>(),
        locator<SignInUseCase>(),
        locator<GetUserUseCase>(),
        locator<SaveCredentialsUseCase>(),
        locator<GetCredentialsUseCase>(),
        locator<DeleteCredentialsUseCase>(),
      ));

  locator.registerLazySingleton(() => DioClient());
  locator.registerLazySingleton(() => HiveCredentialsStorage());
  locator.registerLazySingleton<AuthApiService>(() => AuthApiServiceImpl());
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(locator(), locator()),
  );
  locator.registerLazySingleton(() => RegisterUseCase(locator()));
  locator.registerLazySingleton(() => SignInUseCase(locator()));
  locator.registerLazySingleton(() => GetUserUseCase(locator()));
  locator.registerLazySingleton(() => SaveCredentialsUseCase(locator()));
  locator.registerLazySingleton(() => GetCredentialsUseCase(locator()));
  locator.registerLazySingleton(() => DeleteCredentialsUseCase(locator()));

  // Homepage feature
  locator.registerFactory(() => HomepageCubit(
        locator<GetJobsUseCase>(),
      ));

  locator.registerLazySingleton<JobDataSource>(
    () => JobDataSourceImpl(locator()),
  );
  locator.registerLazySingleton<JobsRepository>(
    () => JobsRepositoryImpl(locator()),
  );
  locator.registerLazySingleton(() => GetJobsUseCase(locator()));

  // Saved jobs page
  locator.registerFactory(() => SavedJobsCubit(
        locator<GetJobsUseCase>(),
        locator<SaveJobUseCase>(),
      ));
  locator.registerLazySingleton(() => SaveJobUseCase(locator()));

  // Applied jobs page
  locator.registerFactory(() => AppliedJobsCubit(
        locator<GetJobsUseCase>(),
        locator<ApplyJobUseCase>(),
      ));
  locator.registerLazySingleton(() => ApplyJobUseCase(locator()));
}
