import 'package:flutter/material.dart';
import 'package:jobs_it/features/job_view/domain/entities/job.dart';

import '../../../../app/theme/app_styles.dart';

class JobTabPage extends StatelessWidget {
  final Job jobItem;

  const JobTabPage({
    super.key,
    required this.jobItem,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Job Description',
          style: AppStyles.bodyMediumBold14,
        ),
        const SizedBox(height: 12),
        Text(
          jobItem.description,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.bodySmall11,
          maxLines: 13,
        ),
      ],
    );
  }
}
