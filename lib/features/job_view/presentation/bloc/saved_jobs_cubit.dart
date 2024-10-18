import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_it/features/job_view/domain/use_cases/jobs_use_case.dart';

import '../../domain/entities/job.dart';

part 'saved_jobs_state.dart';

class SavedJobsCubit extends Cubit<SavedJobsState> {
  final GetJobsUseCase getJobsUseCase;
  final SaveJobUseCase saveJobUseCase;

  SavedJobsCubit(
    this.getJobsUseCase,
    this.saveJobUseCase,
  ) : super(SavedJobsInitial());

  getSavedJobs() async {
    try {
      List<Job> savedJobs = [];
      final jobs = await getJobsUseCase.call();

      for (Job job in jobs) {
        if (job.isSaved == true) {
          savedJobs.add(job);
        }
      }

      emit(SavedJobsLoaded(savedJobs));
    } catch (e) {
      throw Exception('Save job error: $e');
    }
  }

  saveJob(Job job) async {
    await saveJobUseCase.call(param: job);
    getSavedJobs();
  }
}
