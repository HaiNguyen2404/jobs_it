import 'package:jobs_it/features/job_view/data/data_source/job_data_source.dart';
import 'package:jobs_it/features/job_view/data/models/job_model.dart';
import 'package:jobs_it/features/job_view/domain/repositories/jobs_repository.dart';

import '../../domain/entities/job.dart';

class JobsRepositoryImpl implements JobsRepository {
  final JobDataSource dataSource;

  JobsRepositoryImpl(this.dataSource);

  @override
  Future<List<JobModel>> getJobs() async {
    return dataSource.getJobs();
  }

  @override
  Future<void> saveJob(Job job) async {
    return dataSource.saveJob(JobModel.fromEntity(job));
  }

  @override
  Future<void> applyJob(Job job) async {
    return dataSource.applyJob(JobModel.fromEntity(job));
  }
}
