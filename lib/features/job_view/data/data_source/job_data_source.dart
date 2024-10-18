import 'package:dio/dio.dart';
import 'package:jobs_it/app/network/dio_client.dart';
import 'package:jobs_it/features/job_view/data/models/job_model.dart';

abstract class JobDataSource {
  Future<List<JobModel>> getJobs();
  Future<void> saveJob(JobModel job);
  Future<void> applyJob(JobModel job);
}

class JobDataSourceImpl implements JobDataSource {
  final DioClient dioClient;

  JobDataSourceImpl(this.dioClient);

  @override
  Future<List<JobModel>> getJobs() async {
    try {
      final response = await dioClient.get(
        'https://665086abec9b4a4a603267eb.mockapi.io/jobsit/job',
        options: Options(responseType: ResponseType.json),
      );

      List<JobModel> jobs = response.data
          .map<JobModel>((json) => JobModel.fromJson(json))
          .toList();

      return jobs;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> saveJob(JobModel job) async {
    bool savedJob = !(job.isSaved);

    await dioClient.patch(
      'https://665086abec9b4a4a603267eb.mockapi.io/jobsit/job/${job.id}',
      data: {'isSaved': savedJob},
    );
  }

  @override
  Future<void> applyJob(JobModel job) async {
    bool appliedJob = !(job.isApplied);

    await dioClient.patch(
      'https://665086abec9b4a4a603267eb.mockapi.io/jobsit/job/${job.id}',
      data: {'isApplied': appliedJob},
    );
  }
}
