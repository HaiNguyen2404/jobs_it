class Job {
  final int id;
  final String name;
  final String type;
  final String position;
  final int deadline;
  final int candidates;
  final String description;
  final bool isSaved;
  final bool isApplied;

  Job({
    required this.id,
    required this.name,
    required this.type,
    required this.position,
    required this.deadline,
    required this.candidates,
    required this.description,
    required this.isApplied,
    required this.isSaved,
  });
}
