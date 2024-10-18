import 'package:flutter/material.dart';
import 'package:jobs_it/app/theme/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType textInputType;
  final Color? fillColor;
  final TextInputAction? textInputAction;
  final bool? obscureText;
  final Iterable<String>? autofillHints;
  final FocusNode? focusNode;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.textInputType = TextInputType.text,
    this.fillColor,
    this.textInputAction = TextInputAction.next,
    this.obscureText,
    this.autofillHints,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      decoration: decoration,
      textInputAction: textInputAction,
      obscureText: obscureText ?? false,
      autofillHints: autofillHints,
      focusNode: focusNode,
    );
  }

  InputDecoration get decoration {
    return InputDecoration(
      hintText: hintText ?? "",
      hintStyle: const TextStyle(color: AppColors.subtleDark2),
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      fillColor: fillColor ?? Colors.white,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.dark,
          width: 0.5,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ).copyWith(
        borderSide: const BorderSide(
          color: AppColors.primary,
          width: 2,
        ),
      ),
    );
  }
}
