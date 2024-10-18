import 'package:flutter/material.dart';
import 'package:jobs_it/app/theme/app_colors.dart';
import 'package:jobs_it/app/theme/app_styles.dart';
import 'package:jobs_it/app/widgets/base_button.dart';

class CustomButton extends BaseButton {
  const CustomButton({
    super.key,
    this.decoration,
    required super.text,
    super.margin,
    super.alignment,
    super.buttonStyle,
    super.height,
    super.width,
    super.onPressed,
    super.textStyle,
  });

  final BoxDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: buildButtonWidget,
    );
  }

  Widget get buildButtonWidget {
    return GestureDetector(
      onTap: onPressed ?? () {},
      child: Container(
        padding: const EdgeInsets.all(16),
        width: width ?? double.maxFinite,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text!,
          style: AppStyles.titleMediumWhite,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
