import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_it/app/theme/app_colors.dart';
import 'package:jobs_it/app/widgets/custom_avatar.dart';
import 'package:jobs_it/app/widgets/custom_button.dart';
import 'package:jobs_it/app/widgets/custom_search_view.dart';
import 'package:jobs_it/app/widgets/filter_button.dart';
import 'package:jobs_it/app/widgets/filter_square_button.dart';
import 'package:jobs_it/app/widgets/job_list_item.dart';
import 'package:jobs_it/features/job_view/domain/entities/default_filter.dart';
import 'package:jobs_it/features/job_view/domain/entities/filter.dart';
import 'package:jobs_it/features/job_view/presentation/bloc/homepage_cubit.dart';
import '../../../../app/theme/app_styles.dart';
import '../../../../app/widgets/custom_dropdown.dart';

class HomeInitialPage extends StatefulWidget {
  const HomeInitialPage({super.key});

  @override
  State<HomeInitialPage> createState() => _HomeInitialPageState();
}

class _HomeInitialPageState extends State<HomeInitialPage> {
  TextEditingController searchController = TextEditingController();
  Filter filter = Filter.init();

  @override
  void initState() {
    super.initState();
    context.read<HomepageCubit>().getJobs();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: SizedBox(
            width: 120,
            child: Image.asset('lib/app/images/app_logo.png'),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: CustomAvatar(
                image: AssetImage('lib/app/images/google_icon.png'),
                height: 45,
                width: 45,
              ),
            ),
          ],
        ),
        body: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 20),
              _buildSearchSection(context),
              const SizedBox(height: 20),
              _buildJobList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      width: double.maxFinite,
      child: Row(
        children: [
          Expanded(
            child: CustomSearchView(
              controller: searchController,
              hintText: 'Search Job',
            ),
          ),
          const SizedBox(width: 6),
          FilterSquareButton(
            icon: Icons.filter_list,
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return Container(
                    padding: EdgeInsets.only(
                      top: 30,
                      right: 16,
                      left: 16,
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildDropDownSection('Location'),
                        const SizedBox(height: 34),
                        _buildJobTypeSection('Job Type'),
                        const SizedBox(height: 34),
                        _buildJobPositionSection('Job Position'),
                        const SizedBox(height: 34),
                        _buildMajorSection('Major'),
                        const SizedBox(height: 34),
                        const Spacer(),
                        CustomButton(
                          text: 'Update',
                          onPressed: () {
                            if (filter.isEmty()) {
                              context.read<HomepageCubit>().getJobs();
                            } else {
                              context
                                  .read<HomepageCubit>()
                                  .getFilteredJobs(filter);
                            }
                            Navigator.of(context).pop();
                          },
                        ),
                        const SizedBox(height: 34),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildJobList() {
    return Expanded(
      child: BlocBuilder<HomepageCubit, HomepageState>(
        builder: (context, state) {
          if (state is HomepageLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomepageLoaded) {
            return ListView.separated(
              itemBuilder: (context, index) {
                return JobListItem(jobItem: state.jobs[index]);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 16);
              },
              itemCount: state.jobs.length,
              physics: const BouncingScrollPhysics(),
            );
          } else if (state is HomepageError) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else if (state is HomepageFiltered) {
            return ListView.separated(
              itemBuilder: (context, index) {
                return JobListItem(jobItem: state.filteredJobs[index]);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 16);
              },
              itemCount: state.filteredJobs.length,
              physics: const BouncingScrollPhysics(),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _buildDropDownSection(String content) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: AppColors.primary,
              ),
              const SizedBox(width: 4),
              Text(
                content,
                style: AppStyles.titleMedium16,
              ),
            ],
          ),
          const SizedBox(height: 10),
          CustomDropdown(
            currentValue: filter.location,
            icon: Container(
              margin: const EdgeInsets.only(left: 16),
              child: const Icon(Icons.arrow_drop_down),
            ),
            hintText: content,
            iconSize: 20,
            items: DefaultFilter.locations,
            onChanged: (value) {
              filter.location = value;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildJobTypeSection(String content) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            content,
            style: AppStyles.titleMedium16,
          ),
          const SizedBox(height: 4),
          SizedBox(
            width: double.maxFinite,
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: DefaultFilter.jobType.length,
              itemBuilder: (context, index) {
                return FilterButton(
                  activeFilters: filter.jobType!,
                  content: DefaultFilter.jobType[index],
                  onTap: () {
                    if (filter.jobType!
                        .contains(DefaultFilter.jobType[index])) {
                      filter.jobType!.remove(DefaultFilter.jobType[index]);
                    } else {
                      filter.jobType!.add(DefaultFilter.jobType[index]);
                    }
                  },
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 10),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJobPositionSection(String content) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            content,
            style: AppStyles.titleMedium16,
          ),
          const SizedBox(height: 4),
          SizedBox(
            width: double.maxFinite,
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: DefaultFilter.jobPosition.length,
              itemBuilder: (context, index) {
                return FilterButton(
                  activeFilters: filter.jobPosition!,
                  content: DefaultFilter.jobPosition[index],
                  onTap: () {
                    if (filter.jobPosition!
                        .contains(DefaultFilter.jobPosition[index])) {
                      filter.jobPosition!
                          .remove(DefaultFilter.jobPosition[index]);
                    } else {
                      filter.jobPosition!.add(DefaultFilter.jobPosition[index]);
                    }
                  },
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 10),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMajorSection(String content) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            content,
            style: AppStyles.titleMedium16,
          ),
          const SizedBox(height: 4),
          SizedBox(
            width: double.maxFinite,
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: DefaultFilter.major.length,
              itemBuilder: (context, index) {
                return FilterButton(
                  activeFilters: filter.major!,
                  content: DefaultFilter.major[index],
                  onTap: () {
                    if (filter.major!.contains(DefaultFilter.major[index])) {
                      filter.major!.remove(DefaultFilter.major[index]);
                    } else {
                      filter.major!.add(DefaultFilter.major[index]);
                    }
                  },
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 10),
            ),
          ),
        ],
      ),
    );
  }
}
