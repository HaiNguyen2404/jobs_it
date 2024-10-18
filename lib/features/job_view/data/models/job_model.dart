import 'package:jobs_it/features/job_view/domain/entities/job.dart';

class JobModel extends Job {
  JobModel({
    required super.id,
    required super.name,
    required super.companyId,
    required super.type,
    required super.position,
    required super.deadline,
    required super.candidates,
    required super.description,
    required super.isApplied,
    required super.isSaved,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) {
    DateTime targetDate =
        DateTime.fromMillisecondsSinceEpoch(json['deadline'] * 1000);
    DateTime currentDate = DateTime.now();
    int remainingDays = targetDate.difference(currentDate).inDays;

    return JobModel(
      id: int.parse(json['id']),
      name: json['name'] as String,
      companyId: int.parse(json['companyId']),
      type: json['type'] as String,
      position: json['position'] as String,
      deadline: remainingDays,
      candidates: json['candidates'] as int,
      description: json['description'] as String,
      isApplied: json['isApplied'] as bool,
      isSaved: json['isSaved'] as bool,
    );
  }

  factory JobModel.fromEntity(Job entity) {
    return JobModel(
      id: entity.id,
      name: entity.name,
      companyId: entity.companyId,
      type: entity.type,
      position: entity.position,
      deadline: entity.deadline,
      candidates: entity.candidates,
      description: entity.description,
      isApplied: entity.isApplied,
      isSaved: entity.isSaved,
    );
  }
}
