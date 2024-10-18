import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_it/features/job_view/domain/entities/filter.dart';
import 'package:jobs_it/features/job_view/domain/use_cases/jobs_use_case.dart';

import '../../domain/entities/job.dart';

part 'homepage_state.dart';

class HomepageCubit extends Cubit<HomepageState> {
  final GetJobsUseCase getJobsUseCase;

  HomepageCubit(
    this.getJobsUseCase,
  ) : super(HomepageInitial());

  getJobs() async {
    emit(HomepageLoading());
    try {
      final result = await getJobsUseCase.call();
      emit(HomepageLoaded(result));
    } catch (e) {
      throw Exception('Something wrong: $e');
    }
  }

  getFilteredJobs(Filter filters) async {
    emit(HomepageLoading());
    List<Job> filterdList = [];
    try {
      final result = await getJobsUseCase.call();
      for (Job job in result) {
        if (job.isSaved == true) {
          filterdList.add(job);
        }
      }
      emit(HomepageFiltered(filterdList, filters));
    } catch (e) {
      throw Exception('Something wrong: $e');
    }
  }
}
