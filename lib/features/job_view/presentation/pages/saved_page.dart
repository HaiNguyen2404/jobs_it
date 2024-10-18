import 'package:flutter/material.dart';
import 'package:jobs_it/app/theme/app_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_it/app/widgets/job_list_item.dart';
import 'package:jobs_it/features/job_view/presentation/bloc/saved_jobs_cubit.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  @override
  void initState() {
    super.initState();
    getSavedJobs();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Saved Jobs',
            style: AppStyles.titleLarge,
          ),
        ),
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 6),
                _buildSavedJobList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSavedJobList() {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocBuilder<SavedJobsCubit, SavedJobsState>(
        builder: (context, state) {
          if (state is SavedJobsLoaded) {
            return ListView.separated(
              key: const ValueKey('savedJobList'),
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final job = state.savedJobs[index];
                return JobListItem(
                  jobItem: job,
                  key: ValueKey(job.id),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 18);
              },
              itemCount: state.savedJobs.length,
            );
          } else {
            getSavedJobs();
            return const Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  getSavedJobs() {
    context.read<SavedJobsCubit>().getSavedJobs();
  }
}
