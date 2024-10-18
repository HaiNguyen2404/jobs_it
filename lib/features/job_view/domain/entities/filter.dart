class Filter {
  String? location;
  List<String>? jobType;
  List<String>? jobPosition;
  List<String>? major;

  bool isEmty() {
    if (jobType!.isEmpty &&
        jobPosition!.isEmpty &&
        major!.isEmpty &&
        location == 'No location') {
      return true;
    }
    return false;
  }

  factory Filter.init() {
    return Filter(
      location: 'No location',
      jobType: [],
      jobPosition: [],
      major: [],
    );
  }

  Filter({
    this.location,
    this.jobType,
    this.jobPosition,
    this.major,
  });
}
