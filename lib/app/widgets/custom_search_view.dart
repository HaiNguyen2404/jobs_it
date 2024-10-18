import 'package:flutter/material.dart';
import 'package:jobs_it/app/theme/app_colors.dart';
import 'package:jobs_it/app/theme/app_styles.dart';

class CustomSearchView extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final Function()? onClearPressed;

  const CustomSearchView({
    super.key,
    required this.controller,
    this.hintText,
    this.onClearPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: searchViewWidget(context),
    );
  }

  Widget searchViewWidget(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: TextFormField(
        scrollPadding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        controller: controller,
        style: AppStyles.bodyMedium14,
        keyboardType: TextInputType.text,
        decoration: decoration,
      ),
    );
  }

  InputDecoration get decoration {
    return InputDecoration(
      hintText: hintText ?? "",
      hintStyle: AppStyles.hintText14,
      prefixIcon: Container(
        margin: const EdgeInsets.fromLTRB(26, 16, 16, 16),
        child: const Icon(Icons.search),
      ),
      prefixIconConstraints: const BoxConstraints(maxHeight: 56),
      suffixIcon: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: IconButton(
          onPressed: () => controller.text == "",
          icon: const Icon(Icons.clear),
          color: AppColors.subtleDark,
        ),
      ),
      suffixIconConstraints: const BoxConstraints(maxHeight: 56),
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
