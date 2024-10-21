import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_it/app/theme/app_colors.dart';
import 'package:jobs_it/app/widgets/custom_dropdown.dart';
import 'package:jobs_it/features/job_view/domain/entities/default_filter.dart';

import '../../../../app/theme/app_styles.dart';
import '../../../../app/widgets/custom_button.dart';
import '../../../../app/widgets/custom_text_form_field.dart';
import '../../domain/entities/user.dart';
import '../bloc/button_cubit.dart';

class JobInfoEditPage extends StatefulWidget {
  final User user;

  const JobInfoEditPage({
    super.key,
    required this.user,
  });

  @override
  State<JobInfoEditPage> createState() => _JobInfoEditPageState();
}

class _JobInfoEditPageState extends State<JobInfoEditPage> {
  final TextEditingController jobWantedController = TextEditingController();

  final List<String> dropDownList = ['Option 1', 'Option 2', 'Option 3'];

  final TextEditingController coverLetterController = TextEditingController();

  late String positionDropdownValue;
  late String majorDropdownValue;
  late String jobTypeDropdownValue;
  late String jobLocationDropdownValue;

  @override
  void initState() {
    super.initState();
    jobWantedController.text = widget.user.jobWanted ?? '';
    positionDropdownValue = widget.user.position!;
    majorDropdownValue = widget.user.major!;
    jobTypeDropdownValue = widget.user.jobType!;
    jobLocationDropdownValue = widget.user.jobLocation!;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Job Information',
            style: AppStyles.titleLarge,
          ),
        ),
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.only(
                left: 18,
                top: 12,
                right: 18,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTextFieldSection('Job wanted', jobWantedController),
                  const SizedBox(height: 14),
                  _buildPositionSection('Position', DefaultFilter.jobPosition),
                  const SizedBox(height: 14),
                  _buildMajorSection('Major', DefaultFilter.major),
                  const SizedBox(height: 14),
                  _buildJobTypeSection('Job type', DefaultFilter.jobType),
                  const SizedBox(height: 14),
                  _buildJobLocationSection('Location', DefaultFilter.locations),
                  const SizedBox(height: 14),
                  _buildCVSection(),
                  const SizedBox(height: 14),
                  _buildCoverLetterSection(),
                  const SizedBox(height: 14),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  Widget _buildTextFieldSection(
    String content,
    TextEditingController controller,
  ) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            content,
            style: AppStyles.bodyMediumBold14,
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            controller: controller,
            hintText: content,
          ),
        ],
      ),
    );
  }

  Widget _buildCVSection() {
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
        const SizedBox(height: 10),
        Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 0.5,
              color: AppColors.subtleDark,
            ),
            color: Colors.white,
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

  Widget _buildCoverLetterSection() {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Cover Letter',
            style: AppStyles.bodyMediumBold14,
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            controller: coverLetterController,
            hintText: 'Write a brief introduction about yourself',
            textInputAction: TextInputAction.done,
          ),
        ],
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
        text: 'Save',
        onPressed: () {
          User editedUser = User(
            id: widget.user.id,
            firstName: widget.user.firstName,
            lastName: widget.user.lastName,
            email: widget.user.email,
            birthday: widget.user.birthday,
            phone: widget.user.phone,
            gender: widget.user.gender,
            location: widget.user.location,
            university: widget.user.university,
            jobWanted: jobWantedController.text,
            position: positionDropdownValue,
            jobType: jobTypeDropdownValue,
            major: majorDropdownValue,
            jobLocation: jobLocationDropdownValue,
          );
          context.read<ButtonCubit>().updateUser(editedUser);
          Navigator.of(context).pop();
        },
      ),
    );
  }

  Widget _buildPositionSection(
    String content,
    List<String> optionsList,
  ) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            content,
            style: AppStyles.bodyMediumBold14,
          ),
          const SizedBox(height: 10),
          CustomDropdown(
            icon: Container(
              margin: const EdgeInsets.only(left: 16),
              child: const Icon(Icons.arrow_drop_down),
            ),
            onChanged: (value) {
              positionDropdownValue = value;
            },
            hintText: content,
            iconSize: 20,
            items: optionsList,
            currentValue: positionDropdownValue,
          ),
        ],
      ),
    );
  }

  Widget _buildMajorSection(
    String content,
    List<String> optionsList,
  ) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            content,
            style: AppStyles.bodyMediumBold14,
          ),
          const SizedBox(height: 10),
          CustomDropdown(
            icon: Container(
              margin: const EdgeInsets.only(left: 16),
              child: const Icon(Icons.arrow_drop_down),
            ),
            onChanged: (value) {
              majorDropdownValue = value;
            },
            hintText: content,
            iconSize: 20,
            items: optionsList,
            currentValue: majorDropdownValue,
          ),
        ],
      ),
    );
  }

  Widget _buildJobTypeSection(
    String content,
    List<String> optionsList,
  ) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            content,
            style: AppStyles.bodyMediumBold14,
          ),
          const SizedBox(height: 10),
          CustomDropdown(
            icon: Container(
              margin: const EdgeInsets.only(left: 16),
              child: const Icon(Icons.arrow_drop_down),
            ),
            onChanged: (value) {
              jobTypeDropdownValue = value;
            },
            hintText: content,
            iconSize: 20,
            items: optionsList,
            currentValue: jobTypeDropdownValue,
          ),
        ],
      ),
    );
  }

  Widget _buildJobLocationSection(
    String content,
    List<String> optionsList,
  ) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            content,
            style: AppStyles.bodyMediumBold14,
          ),
          const SizedBox(height: 10),
          CustomDropdown(
            icon: Container(
              margin: const EdgeInsets.only(left: 16),
              child: const Icon(Icons.arrow_drop_down),
            ),
            onChanged: (value) {
              jobLocationDropdownValue = value;
            },
            hintText: content,
            iconSize: 20,
            items: optionsList,
            currentValue: jobLocationDropdownValue,
          ),
        ],
      ),
    );
  }
}
