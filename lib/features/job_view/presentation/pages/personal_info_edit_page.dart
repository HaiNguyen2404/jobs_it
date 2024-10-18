import 'package:flutter/material.dart';
import 'package:jobs_it/app/widgets/custom_avatar.dart';
import 'package:jobs_it/app/widgets/custom_button.dart';
import 'package:jobs_it/app/widgets/custom_dropdown.dart';
import 'package:jobs_it/app/widgets/custom_text_form_field.dart';

import '../../../../app/theme/app_styles.dart';

class PersonalInfoEditPage extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final List<String> dropDownItemList = ['Option 1', 'Option 2', 'Option 3'];

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController universityController = TextEditingController();

  PersonalInfoEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Personal Information',
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
                right: 12,
              ),
              child: Column(
                children: [
                  const Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CustomAvatar(
                        image: AssetImage('lib/app/images/google_icon.png'),
                        height: 76,
                        width: 76,
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  _buildTextFieldSection('First Name', firstNameController),
                  const SizedBox(height: 14),
                  _buildTextFieldSection('Last Name', lastNameController),
                  const SizedBox(height: 14),
                  _buildTextFieldSection('Email', emailController),
                  const SizedBox(height: 14),
                  _buildDropDownSection('Date of Birth'),
                  const SizedBox(height: 14),
                  _buildTextFieldSection('Phone', phoneController),
                  const SizedBox(height: 14),
                  _buildDropDownSection('Gender'),
                  const SizedBox(height: 14),
                  _buildDropDownSection('City'),
                  const SizedBox(height: 14),
                  _buildTextFieldSection('Address', addressController),
                  const SizedBox(height: 14),
                  _buildTextFieldSection('University', addressController),
                  const SizedBox(height: 20),
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
          CustomDropdown(
            icon: Container(
              margin: const EdgeInsets.only(left: 16),
              child: const Icon(Icons.arrow_drop_down),
            ),
            hintText: content,
            iconSize: 20,
            items: dropDownItemList,
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
