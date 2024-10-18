import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_it/app/theme/app_styles.dart';
import 'package:jobs_it/app/widgets/applied_job_item.dart';
import 'package:jobs_it/features/job_view/presentation/bloc/applied_jobs_cubit.dart';

class AppliedPage extends StatefulWidget {
  const AppliedPage({super.key});

  @override
  State<AppliedPage> createState() => _AppliedPageState();
}

class _AppliedPageState extends State<AppliedPage> {
  @override
  void initState() {
    super.initState();
    context.read<AppliedJobsCubit>().getAppliedJobs();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Applied Jobs',
            style: AppStyles.titleLarge,
          ),
        ),
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 6),
                _buildAppliedJobList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppliedJobList() {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocBuilder<AppliedJobsCubit, AppliedJobsState>(
        builder: (context, state) {
          if (state is AppliedJobsLoaded) {
            return ListView.separated(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return AppliedJobItem(
                  jobItem: state.appliedJobs[index],
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 18);
              },
              itemCount: state.appliedJobs.length,
            );
          } else {
            getAppliedJobs();
            return const Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  getAppliedJobs() {
    context.read<AppliedJobsCubit>().getAppliedJobs();
  }
}
