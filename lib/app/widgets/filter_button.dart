import 'package:flutter/material.dart';
import 'package:jobs_it/app/theme/app_colors.dart';
import 'package:jobs_it/app/theme/app_styles.dart';

class FilterButton extends StatefulWidget {
  final String content;
  final void Function() onTap;
  final List<String> activeFilters;

  const FilterButton({
    super.key,
    required this.content,
    required this.onTap,
    required this.activeFilters,
  });

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  bool isActive = false;

  @override
  void initState() {
    super.initState();
    isActive = widget.activeFilters.contains(widget.content);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isActive = !isActive;
        });
        widget.onTap();
      },
      child: Container(
        constraints: const BoxConstraints(maxHeight: 30),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: !isActive ? Colors.white : AppColors.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          widget.content,
          style: !isActive ? AppStyles.bodySmall11 : AppStyles.bodySmallWhite11,
        ),
      ),
    );
  }
}
