import 'package:flutter/material.dart';
import 'package:jobs_it/app/theme/app_colors.dart';

class CustomSwitch extends StatelessWidget {
  final bool? value;
  final Function(bool) onChanged;

  const CustomSwitch({
    super.key,
    required this.onChanged,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: switchWidget,
    );
  }

  Widget get switchWidget {
    return Transform.scale(
      scale: 0.75,
      child: Switch(
        value: value ?? false,
        onChanged: onChanged,
        activeColor: Colors.white,
        activeTrackColor: AppColors.primary,
        inactiveThumbColor: AppColors.subtleDark2,
      ),
    );
  }
}
