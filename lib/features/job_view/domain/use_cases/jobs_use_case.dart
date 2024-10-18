import 'package:jobs_it/app/usecase/usecase.dart';
import 'package:jobs_it/features/job_view/domain/repositories/jobs_repository.dart';

import '../entities/job.dart';

class GetJobsUseCase extends Usecase<List<Job>, dynamic> {
  final JobsRepository repository;

  GetJobsUseCase(this.repository);

  @override
  Future<List<Job>> call({param}) async {
    return repository.getJobs();
  }
}

class SaveJobUseCase extends Usecase<void, Job> {
  final JobsRepository repository;

  SaveJobUseCase(this.repository);

  @override
  Future<void> call({Job? param}) async {
    await repository.saveJob(param!);
  }
}

class ApplyJobUseCase extends Usecase<void, Job> {
  final JobsRepository repository;

  ApplyJobUseCase(this.repository);

  @override
  Future<void> call({Job? param}) async {
    await repository.applyJob(param!);
  }
}
