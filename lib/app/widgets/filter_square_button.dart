import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_it/app/theme/app_colors.dart';
import 'package:jobs_it/features/job_view/presentation/bloc/homepage_cubit.dart';

class FilterSquareButton extends StatelessWidget {
  final IconData icon;
  final double? size;
  final Function()? onTap;

  const FilterSquareButton({
    super.key,
    required this.icon,
    this.size,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomepageCubit, HomepageState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: onTap ?? () {},
          child: Container(
            height: size ?? 54,
            width: size ?? 54,
            decoration: BoxDecoration(
              color: (state is HomepageFiltered)
                  ? AppColors.primary
                  : Colors.white,
              border: Border.all(
                color: (state is HomepageFiltered)
                    ? Colors.white
                    : AppColors.subtleDark,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Icon(
                icon,
                color: (state is HomepageFiltered)
                    ? Colors.white
                    : AppColors.subtleDark,
              ),
            ),
          ),
        );
      },
    );
  }
}
