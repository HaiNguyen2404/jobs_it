import 'package:flutter/material.dart';
import 'package:jobs_it/app/theme/app_colors.dart';
import 'package:jobs_it/app/theme/app_styles.dart';
import 'package:jobs_it/app/widgets/option_tile.dart';
import 'package:jobs_it/app/widgets/square_avatar.dart';
import 'package:jobs_it/features/job_view/presentation/bloc/applied_jobs_cubit.dart';
import 'package:jobs_it/features/job_view/presentation/pages/company_info_page.dart';
import 'package:jobs_it/features/job_view/presentation/pages/job_tab_page.dart';

import '../../../../app/widgets/circle_display.dart';
import '../../../../app/widgets/custom_button.dart';
import '../../../../app/widgets/custom_text_form_field.dart';
import '../../domain/entities/job.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JobDetailPage extends StatefulWidget {
  final Job jobItem;

  const JobDetailPage({
    super.key,
    required this.jobItem,
  });

  @override
  State<JobDetailPage> createState() => _JobDetailPageState();
}

class _JobDetailPageState extends State<JobDetailPage>
    with TickerProviderStateMixin {
  late TabController tabViewController;
  List<Widget> _pages = [];
  int selectedValue = 0;

  final TextEditingController coverLetterController = TextEditingController();

  @override
  void initState() {
    super.initState();
    tabViewController = TabController(length: 2, vsync: this);
    _pages = [
      JobTabPage(
        jobItem: widget.jobItem,
      ),
      const CompanyInfoPage(),
    ];
  }

  @override
  void dispose() {
    super.dispose();
    coverLetterController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Job Detail',
            style: AppStyles.titleLarge,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.bookmark_outline,
                color: AppColors.primary,
                size: 30,
              ),
            ),
          ],
        ),
        bottomNavigationBar: _buildBottomBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  const SquareAvatar(icon: Icons.filter, size: 76),
                  const SizedBox(height: 14),
                  Text(
                    widget.jobItem.name,
                    style: AppStyles.titleMediumPrimary,
                  ),
                  const SizedBox(height: 2),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Company Name',
                        style: AppStyles.bodyMedium14,
                      ),
                      SizedBox(width: 2),
                      Icon(
                        Icons.location_on_outlined,
                        color: AppColors.primary,
                      ),
                      SizedBox(width: 2),
                      Text(
                        'Location',
                        style: AppStyles.bodyMedium14,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  _buildOptions(),
                  const SizedBox(height: 32),
                  _buildJobInfo(),
                  const SizedBox(height: 32),
                  _buildTabView(),
                  const SizedBox(height: 28),
                  _buildTabPage(),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOptions() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(
        direction: Axis.horizontal,
        runSpacing: 10,
        spacing: 10,
        children: List<Widget>.generate(
          3,
          (index) => const OptionTile(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildJobInfo() {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildColumnBag(
            userIcon: Icons.person_outline,
            savedText: 'Position',
            userScore: 'Front end',
          ),
          const SizedBox(width: 30),
          _buildColumnBag(
            userIcon: Icons.work_outline,
            savedText: 'Job Type',
            userScore: 'Full time',
          ),
          const SizedBox(width: 30),
          _buildColumnBag(
            userIcon: Icons.account_balance_wallet_outlined,
            savedText: 'Salary',
            userScore: '\$2k - \$5k',
          ),
          const SizedBox(width: 30),
          _buildColumnBag(
            userIcon: Icons.timer_outlined,
            savedText: 'Deadline',
            userScore: '24/03/23',
          ),
        ],
      ),
    );
  }

  Widget _buildColumnBag({
    required IconData userIcon,
    required String savedText,
    required String userScore,
  }) {
    return SizedBox(
      width: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleDisplay(icon: userIcon),
          const SizedBox(height: 4),
          Padding(
            padding: EdgeInsets.zero,
            child: Text(
              savedText,
              style: AppStyles.bodySmall11,
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: EdgeInsets.zero,
            child: Text(
              userScore,
              style: AppStyles.bodySmallBold11,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabView() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.primary,
          width: 1,
        ),
      ),
      width: double.maxFinite,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: TabBar(
          physics: const NeverScrollableScrollPhysics(),
          isScrollable: false,
          onTap: (value) {
            setState(() {
              selectedValue = value;
            });
          },
          controller: tabViewController,
          labelColor: Colors.white,
          labelStyle: AppStyles.bodyMediumBold14,
          unselectedLabelColor: AppColors.subtleDark,
          unselectedLabelStyle: AppStyles.bodyMediumBold14,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(8),
          ),
          tabs: const [
            Tab(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                child: Text('Description'),
              ),
            ),
            Tab(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                child: Text('Company'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabPage() {
    return SizedBox(
      height: 294,
      child: TabBarView(
        controller: tabViewController,
        children: _pages,
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Container(
      height: 100,
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: CustomButton(
        text: 'Apply',
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            ),
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
                    const SizedBox(height: 34),
                    _buildCVPlaceHolder(),
                    const SizedBox(height: 34),
                    _buildCoverLetter(),
                    const Spacer(),
                    CustomButton(
                      text: 'Apply',
                      onPressed: () {
                        context
                            .read<AppliedJobsCubit>()
                            .applyJob(widget.jobItem);
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
    );
  }

  Widget _buildCVPlaceHolder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 4),
          child: Text(
            "CV",
            style: AppStyles.bodyMediumBold14,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.subtleDark2,
          ),
          child: const Text(
            'CV Placeholder',
            textAlign: TextAlign.center,
            style: AppStyles.bodyMediumGreyBold14,
          ),
        ),
      ],
    );
  }

  Widget _buildCoverLetter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 4),
          child: Text(
            "Cover letter",
            style: AppStyles.bodyMediumBold14,
          ),
        ),
        const SizedBox(height: 20),
        CustomTextFormField(
          controller: coverLetterController,
          hintText: 'Write a brief introduction about yourself',
          textInputAction: TextInputAction.done,
        ),
      ],
    );
  }
}
