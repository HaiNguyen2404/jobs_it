import '../entities/job.dart';

abstract class JobsRepository {
  Future<List<Job>> getJobs();
  Future<void> saveJob(Job job);
  Future<void> applyJob(Job job);
}
