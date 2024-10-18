import 'package:flutter/material.dart';
import 'package:jobs_it/app/theme/app_colors.dart';
import 'package:jobs_it/app/widgets/custom_dropdown.dart';

import '../../../../app/theme/app_styles.dart';
import '../../../../app/widgets/custom_button.dart';
import '../../../../app/widgets/custom_text_form_field.dart';

class JobInfoEditPage extends StatelessWidget {
  final TextEditingController jobWantedController = TextEditingController();

  final List<String> dropDownList = ['Option 1', 'Option 2', 'Option 3'];

  final TextEditingController coverLetterController = TextEditingController();

  JobInfoEditPage({super.key});

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
                  _buildDropDownSection('Position'),
                  const SizedBox(height: 14),
                  _buildDropDownSection('Major'),
                  const SizedBox(height: 14),
                  _buildDropDownSection('Job type'),
                  const SizedBox(height: 14),
                  _buildNoOptionDropDown('Location'),
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

  Widget _buildDropDownSection(String content) {
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
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              CustomDropdown(
                icon: Container(
                  margin: const EdgeInsets.only(left: 16),
                  child: const Icon(Icons.arrow_drop_down),
                ),
                hintText: '',
                iconSize: 20,
                items: dropDownList,
              ),
              Container(
                width: 76,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Option',
                      style: AppStyles.bodySmall11,
                    ),
                    SizedBox(
                      height: 10,
                      width: 20,
                      child: Icon(
                        Icons.clear,
                        size: 20,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNoOptionDropDown(String content) {
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
            hintText: content,
            iconSize: 20,
            items: dropDownList,
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
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
