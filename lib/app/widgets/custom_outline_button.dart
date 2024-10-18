import 'package:flutter/material.dart';
import 'package:jobs_it/app/theme/app_colors.dart';
import 'package:jobs_it/app/theme/app_styles.dart';

class CustomOutlineButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;

  const CustomOutlineButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: buildOutlineButton,
    );
  }

  Widget get buildOutlineButton {
    return Container(
      height: 56,
      width: double.maxFinite,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.primary,
          width: 2,
          strokeAlign: BorderSide.strokeAlignInside,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: GestureDetector(
        onTap: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: AppStyles.titleMediumPrimary,
            )
          ],
        ),
      ),
    );
  }
}
