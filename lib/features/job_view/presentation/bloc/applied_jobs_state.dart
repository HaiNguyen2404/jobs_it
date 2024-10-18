part of 'applied_jobs_cubit.dart';

abstract class AppliedJobsState {}

class AppliedJobsInitial extends AppliedJobsState {}

class AppliedJobsLoaded extends AppliedJobsState {
  final List<Job> appliedJobs;

  AppliedJobsLoaded(this.appliedJobs);
}
