part of 'homepage_cubit.dart';

abstract class HomepageState {}

class HomepageInitial extends HomepageState {}

class HomepageLoading extends HomepageState {}

class HomepageLoaded extends HomepageState {
  final List<Job> jobs;

  HomepageLoaded(this.jobs);
}

class HomepageFiltered extends HomepageState {
  final List<Job> filteredJobs;
  final Filter filters;

  HomepageFiltered(this.filteredJobs, this.filters);
}

class HomepageError extends HomepageState {
  final String errorMessage;

  HomepageError(this.errorMessage);
}
