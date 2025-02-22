import 'package:flutter/material.dart';
import 'package:jobs_it/app/theme/app_colors.dart';
import 'package:jobs_it/app/theme/app_styles.dart';

class OptionTile extends StatelessWidget {
  final Color? color;
  final String? content;

  const OptionTile({
    super.key,
    this.color,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 30),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color ?? AppColors.background,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        content ?? 'Option',
        style: AppStyles.bodySmall11,
      ),
    );
  }
}
