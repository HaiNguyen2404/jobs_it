import 'package:flutter/material.dart';
import 'package:jobs_it/app/widgets/custom_avatar.dart';
import 'package:jobs_it/app/widgets/custom_button.dart';
import 'package:jobs_it/app/widgets/custom_dropdown.dart';
import 'package:jobs_it/app/widgets/custom_text_form_field.dart';
import 'package:jobs_it/features/authentication/domain/entities/user.dart';
import 'package:jobs_it/features/authentication/presentation/bloc/button_cubit.dart';
import 'package:jobs_it/features/job_view/domain/entities/default_filter.dart';
import '../../../../app/theme/app_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalInfoEditPage extends StatefulWidget {
  final User user;
  const PersonalInfoEditPage({
    super.key,
    required this.user,
  });

  @override
  State<PersonalInfoEditPage> createState() => _PersonalInfoEditPageState();
}

class _PersonalInfoEditPageState extends State<PersonalInfoEditPage> {
  late String genderDropdownValue = '';
  late String cityDropdownValue = '';

  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final List<String> dropDownItemList = ['Option 1', 'Option 2', 'Option 3'];

  static const genderOptions = ['Male', 'Female'];

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController addressController = TextEditingController();

  final TextEditingController universityController = TextEditingController();

  final TextEditingController birthdayController = TextEditingController();

  @override
  void initState() {
    super.initState();

    firstNameController.text = widget.user.firstName;
    lastNameController.text = widget.user.lastName;
    emailController.text = widget.user.email;
    phoneController.text = widget.user.phone ?? '';
    universityController.text = widget.user.university ?? '';
    birthdayController.text = widget.user.birthday ?? '';

    genderDropdownValue = widget.user.gender ?? '';
    cityDropdownValue = widget.user.location ?? '';
  }

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
                  _buildDatePickerSection('Date of Birth'),
                  const SizedBox(height: 14),
                  _buildTextFieldSection('Phone', phoneController),
                  const SizedBox(height: 14),
                  _buildDropDownSection('Gender', genderOptions),
                  const SizedBox(height: 14),
                  _buildDropDownSection('City', DefaultFilter.locations),
                  const SizedBox(height: 14),
                  _buildTextFieldSection('Address', addressController),
                  const SizedBox(height: 14),
                  _buildTextFieldSection('University', universityController),
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
            textInputAction: TextInputAction.done,
          ),
        ],
      ),
    );
  }

  Widget _buildDropDownSection(
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
              (content == 'Gender')
                  ? genderDropdownValue = value
                  : cityDropdownValue = value;
            },
            hintText: content,
            iconSize: 20,
            items: optionsList,
            currentValue:
                (content == "Gender") ? genderDropdownValue : cityDropdownValue,
          ),
        ],
      ),
    );
  }

  Widget _buildDatePickerSection(String content) {
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
            controller: birthdayController,
            hintText: content,
            readOnly: true,
            onTap: () {
              _selectDate();
            },
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
            firstName: firstNameController.text,
            lastName: lastNameController.text,
            email: emailController.text,
            birthday: birthdayController.text,
            phone: phoneController.text,
            gender: genderDropdownValue,
            location: cityDropdownValue,
            university: universityController.text,
            jobWanted: widget.user.jobWanted,
            position: widget.user.position,
            jobType: widget.user.jobType,
            major: widget.user.major,
            jobLocation: widget.user.jobLocation,
          );
          context.read<ButtonCubit>().updateUser(editedUser);
          Navigator.of(context).pop();
        },
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      initialDate: DateTime.now(),
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      String formattedDate = '${picked.day}/${picked.month}/${picked.year}';
      setState(() {
        birthdayController.text = formattedDate;
      });
    }
  }
}
