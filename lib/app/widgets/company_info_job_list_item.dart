import 'package:flutter/material.dart';
import 'package:jobs_it/app/theme/app_colors.dart';
import 'package:jobs_it/app/theme/app_styles.dart';
import 'package:jobs_it/app/widgets/square_avatar.dart';

class CompanyInfoJobListItem extends StatelessWidget {
  const CompanyInfoJobListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 200,
        height: 200,
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
            const SizedBox(
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SquareAvatar(icon: Icons.filter),
                  SizedBox(width: 12),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Job Title',
                            style: AppStyles.titleMediumPrimary,
                          ),
                          Text(
                            'Company Name',
                            style: AppStyles.bodySmall11,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Icon(
                    Icons.bookmark_outline,
                    color: AppColors.primary,
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
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Option',
                        style: AppStyles.bodySmall11,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.people_alt,
                  color: AppColors.primary,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                    '10',
                    style: AppStyles.bodyMedium14,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.timer,
                  color: AppColors.primary,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                    '3d left',
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
