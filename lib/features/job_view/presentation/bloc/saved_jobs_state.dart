part of 'saved_jobs_cubit.dart';

abstract class SavedJobsState {}

class SavedJobsInitial extends SavedJobsState {}

class SavedJobsLoaded extends SavedJobsState {
  final List<Job> savedJobs;

  SavedJobsLoaded(this.savedJobs);
}
