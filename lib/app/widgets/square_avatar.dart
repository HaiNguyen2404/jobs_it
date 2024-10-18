import 'package:flutter/material.dart';
import 'package:jobs_it/app/theme/app_colors.dart';

class SquareAvatar extends StatelessWidget {
  final IconData icon;
  final double? size;
  final Function()? onTap;

  const SquareAvatar({
    super.key,
    required this.icon,
    this.size,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        height: size ?? 54,
        width: size ?? 54,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: AppColors.subtleDark,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(10),
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
