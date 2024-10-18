import 'package:flutter/material.dart';
import 'package:jobs_it/app/theme/app_colors.dart';
import 'package:jobs_it/app/theme/app_styles.dart';
import 'package:jobs_it/app/widgets/square_avatar.dart';
import 'package:jobs_it/features/job_view/presentation/bloc/saved_jobs_cubit.dart';
import 'package:jobs_it/features/job_view/presentation/pages/job_detail_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/job_view/domain/entities/job.dart';

class JobListItem extends StatefulWidget {
  final Job jobItem;

  const JobListItem({
    super.key,
    required this.jobItem,
  });

  @override
  State<JobListItem> createState() => _JobListItemState();
}

class _JobListItemState extends State<JobListItem> {
  bool isSaved = false;

  @override
  void initState() {
    super.initState();
    isSaved = widget.jobItem.isSaved;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => JobDetailPage(
            jobItem: widget.jobItem,
          ),
        ),
      ),
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 4),
            SizedBox(
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SquareAvatar(icon: Icons.filter),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.jobItem.name,
                            style: AppStyles.titleMediumPrimary,
                          ),
                          const Text(
                            'Company Name',
                            style: AppStyles.bodySmall11,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  IconButton(
                    onPressed: () {
                      context.read<SavedJobsCubit>().saveJob(widget.jobItem);
                      setState(() {
                        isSaved = !isSaved;
                      });
                    },
                    icon: isSaved
                        ? const Icon(
                            Icons.bookmark,
                            color: AppColors.primary,
                          )
                        : const Icon(
                            Icons.bookmark_outline,
                            color: AppColors.primary,
                          ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            SizedBox(
              width: double.maxFinite,
              child: Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        widget.jobItem.type,
                        style: AppStyles.bodySmall11,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(
              width: double.maxFinite,
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: AppColors.primary,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Text(
                      'Company Address',
                      style: AppStyles.bodyMedium14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.people_alt,
                  color: AppColors.primary,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    widget.jobItem.candidates.toString(),
                    style: AppStyles.bodyMedium14,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.timer,
                  color: AppColors.primary,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    '${widget.jobItem.deadline} days left',
                    style: AppStyles.bodyMedium14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
