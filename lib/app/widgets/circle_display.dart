import 'package:flutter/material.dart';
import 'package:jobs_it/app/theme/app_colors.dart';

class CircleDisplay extends StatelessWidget {
  final IconData icon;
  const CircleDisplay({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 54,
        width: 54,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Icon(
            icon,
            color: AppColors.subtleDark,
          ),
        ),
      ),
    );
  }
}
