import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_it/features/job_view/domain/use_cases/jobs_use_case.dart';
import '../../domain/entities/job.dart';

part 'applied_jobs_state.dart';

class AppliedJobsCubit extends Cubit<AppliedJobsState> {
  final GetJobsUseCase getJobsUseCase;
  final ApplyJobUseCase applyJobUseCase;

  AppliedJobsCubit(
    this.getJobsUseCase,
    this.applyJobUseCase,
  ) : super(AppliedJobsInitial());

  getAppliedJobs() async {
    emit(AppliedJobsInitial());
    try {
      List<Job> appliedJobs = [];
      final jobs = await getJobsUseCase.call();

      for (Job job in jobs) {
        if (job.isApplied == true) {
          appliedJobs.add(job);
        }
      }

      emit(AppliedJobsLoaded(appliedJobs));
    } catch (e) {
      throw Exception('Apply job error: $e');
    }
  }

  applyJob(Job job) async {
    await applyJobUseCase.call(param: job);
    getAppliedJobs();
  }
}
