import 'package:flutter/material.dart';
import 'package:jobs_it/app/theme/app_colors.dart';
import 'package:jobs_it/app/theme/app_styles.dart';

class CustomDropdown extends StatelessWidget {
  final Widget icon;
  final double iconSize;
  final String hintText;
  final List<String> items;
  final void Function(String value)? onChanged;
  final String? currentValue;

  const CustomDropdown({
    super.key,
    required this.icon,
    required this.hintText,
    required this.iconSize,
    required this.items,
    this.onChanged,
    this.currentValue,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: dropDownWidget,
    );
  }

  Widget get dropDownWidget {
    return SizedBox(
      width: double.maxFinite,
      child: DropdownButtonFormField(
        value: currentValue ?? items.first,
        icon: icon,
        iconSize: iconSize,
        isExpanded: true,
        style: AppStyles.bodySmall11,
        hint: Text(
          hintText,
          style: AppStyles.hintText14,
        ),
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.bodyMedium14,
            ),
          );
        }).toList(),
        decoration: decoration,
        onChanged: (value) {
          if (onChanged != null) {
            onChanged!(value!);
          }
        },
      ),
    );
  }

  InputDecoration get decoration {
    return InputDecoration(
      isDense: true,
      contentPadding: const EdgeInsets.fromLTRB(16, 16, 12, 16),
      fillColor: Colors.white,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.subtleDark,
          width: 0.5,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.primary,
          width: 2,
        ),
      ),
    );
  }
}
