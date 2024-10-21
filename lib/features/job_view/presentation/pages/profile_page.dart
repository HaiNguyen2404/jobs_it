import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_it/app/routes/app_routes.dart';
import 'package:jobs_it/app/theme/app_colors.dart';
import 'package:jobs_it/app/widgets/custom_avatar.dart';
import 'package:jobs_it/app/widgets/custom_button.dart';
import 'package:jobs_it/app/widgets/custom_outline_button.dart';
import 'package:jobs_it/app/widgets/custom_switch.dart';
import 'package:jobs_it/app/widgets/option_tile.dart';
import 'package:jobs_it/features/authentication/presentation/bloc/button_cubit.dart';
import 'package:jobs_it/features/job_view/presentation/pages/job_info_edit_page.dart';
import 'package:jobs_it/features/job_view/presentation/pages/personal_info_edit_page.dart';
import '../../../../app/theme/app_styles.dart';
import '../../../../app/widgets/circle_display.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool allowSearchSwitch = true;
  bool mailNotiSwitch = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Profile',
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
                top: 14,
                right: 18,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 8),
                  const CustomAvatar(
                    image: AssetImage('lib/app/images/google_icon.png'),
                    height: 86,
                    width: 86,
                  ),
                  const SizedBox(height: 6),
                  BlocBuilder<ButtonCubit, ButtonState>(
                    builder: (context, state) {
                      if (state is ButtonSuccessState) {
                        return Text(
                          '${state.user.firstName} ${state.user.lastName}',
                          style: AppStyles.titleLarge,
                        );
                      } else if (state is ButtonFailureState) {
                        return const Text(
                          'Not Signed in',
                          style: AppStyles.titleLarge,
                        );
                      } else {
                        return const Text(
                          'Unhandled',
                          style: AppStyles.titleLarge,
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: 140,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: _buildColumnBag(
                            userIcon: Icons.person_outline,
                            savedText: "Applied",
                            userScore: "2",
                          ),
                        ),
                        Expanded(
                          child: _buildColumnBag(
                            userIcon: Icons.work_outline,
                            savedText: "Saved",
                            userScore: "6",
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),
                  _buildToggleRow('Allow employers to search your profile'),
                  _buildMailToggleRow('Email Notification'),
                  const SizedBox(height: 40),
                  _buildPersonalInfoSection(),
                  const SizedBox(height: 20),
                  _buildJobInfoRow(),
                  const SizedBox(height: 10),
                  _buildJobInfoSection(),
                  const SizedBox(height: 14),
                  _buildChangePasswordButton(),
                  const SizedBox(height: 10),
                  _buildLogOutButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildColumnBag({
    required IconData userIcon,
    required String savedText,
    required String userScore,
  }) {
    return Column(
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
            style: AppStyles.bodyMediumBold14,
          ),
        ),
      ],
    );
  }

  Widget _buildToggleRow(String text) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          CustomSwitch(
            value: allowSearchSwitch,
            onChanged: (value) {
              setState(() {
                allowSearchSwitch = value;
              });
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8,
                bottom: 2,
              ),
              child: Text(
                text,
                style: AppStyles.bodyMedium14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMailToggleRow(String text) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          CustomSwitch(
            value: mailNotiSwitch,
            onChanged: (value) {
              setState(() {
                mailNotiSwitch = value;
              });
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8,
                bottom: 2,
              ),
              child: Text(
                text,
                style: AppStyles.bodyMedium14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalInfoSection() {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Personal Information',
                  style: AppStyles.bodyMediumBold14,
                ),
                BlocBuilder<ButtonCubit, ButtonState>(
                  builder: (context, state) {
                    return IconButton(
                      onPressed: state is ButtonSuccessState
                          ? () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => PersonalInfoEditPage(
                                    user: state.user,
                                  ),
                                ),
                              );
                            }
                          : () {},
                      icon: const Icon(
                        Icons.edit_square,
                        color: AppColors.primary,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 14,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: BlocBuilder<ButtonCubit, ButtonState>(
              builder: (context, state) {
                if (state is ButtonSuccessState) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        child: _buildInfoRow(
                          icon: Icons.mail_outline,
                          content: state.user.email,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.maxFinite,
                        child: _buildInfoRow(
                          icon: Icons.phone_in_talk_outlined,
                          content: state.user.phone ?? 'Unset',
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.maxFinite,
                        child: _buildInfoRow(
                          icon: Icons.location_on_outlined,
                          content: state.user.location ?? 'Unset',
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.maxFinite,
                        child: _buildInfoRow(
                          icon: Icons.home_outlined,
                          content: state.user.university ?? 'Unset',
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.maxFinite,
                        child: _buildInfoRow(
                          icon: Icons.calendar_month_outlined,
                          content: "24/05/2003",
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.maxFinite,
                        child: _buildInfoRow(
                          icon: Icons.person_outline,
                          content: state.user.gender ?? 'Unset',
                        ),
                      ),
                    ],
                  );
                } else {
                  return const SizedBox(height: 50);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({required IconData icon, required String content}) {
    return Row(
      children: [
        Icon(icon, color: AppColors.primary),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(
            content,
            style: AppStyles.bodyMedium14,
          ),
        ),
      ],
    );
  }

  Widget _buildJobInfoRow() {
    return BlocBuilder<ButtonCubit, ButtonState>(
      builder: (context, state) {
        return Container(
          width: double.maxFinite,
          margin: const EdgeInsets.only(left: 12, right: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Job Information',
                style: AppStyles.bodyMediumBold14,
              ),
              BlocBuilder<ButtonCubit, ButtonState>(
                builder: (context, state) {
                  return IconButton(
                    onPressed: state is ButtonSuccessState
                        ? () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => JobInfoEditPage(
                                  user: state.user,
                                ),
                              ),
                            );
                          }
                        : () {},
                    icon: const Icon(
                      Icons.edit_square,
                      color: AppColors.primary,
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildJobInfoSection() {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: BlocBuilder<ButtonCubit, ButtonState>(
        builder: (context, state) {
          if (state is ButtonSuccessState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: Text(
                    'Job Wanted',
                    style: AppStyles.bodyMediumBold14,
                  ),
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: Text(
                    state.user.jobWanted!,
                    style: AppStyles.bodyMedium14,
                  ),
                ),
                const SizedBox(height: 14),
                const Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: Text(
                    "Position",
                    style: AppStyles.bodyMediumBold14,
                  ),
                ),
                const SizedBox(height: 4),
                OptionTile(content: state.user.position),
                const SizedBox(height: 14),
                const Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: Text(
                    "Major",
                    style: AppStyles.bodyMediumBold14,
                  ),
                ),
                const SizedBox(height: 4),
                OptionTile(content: state.user.major),
                const SizedBox(height: 14),
                const Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: Text(
                    "Job type",
                    style: AppStyles.bodyMediumBold14,
                  ),
                ),
                const SizedBox(height: 4),
                OptionTile(content: state.user.jobType),
                const SizedBox(height: 14),
                const Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: Text(
                    "Job location",
                    style: AppStyles.bodyMediumBold14,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  width: double.maxFinite,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  child: _buildInfoRow(
                    icon: Icons.location_on_outlined,
                    content: state.user.jobLocation!,
                  ),
                ),
                const SizedBox(height: 14),
                const Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: Text(
                    "CV",
                    style: AppStyles.bodyMediumBold14,
                  ),
                ),
                const SizedBox(height: 4),
                _buildCVPlaceHolder(),
                const SizedBox(height: 14),
                const Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: Text(
                    "Cover letter",
                    style: AppStyles.bodyMediumBold14,
                  ),
                ),
                const SizedBox(height: 4),
                const Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: Text('Write a brief introduction about yourself'),
                ),
                const SizedBox(height: 4),
              ],
            );
          } else {
            return const SizedBox(height: 20);
          }
        },
      ),
    );
  }

  Widget _buildCVPlaceHolder() {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.background,
      ),
      child: const Text(
        'CV Placeholder',
        textAlign: TextAlign.center,
        style: AppStyles.bodyMediumGreyBold14,
      ),
    );
  }

  Widget _buildChangePasswordButton() {
    return CustomOutlineButton(
      onPressed: () {
        Navigator.of(context).pushNamed(AppRoutes.changePasswordPage);
      },
      text: 'Change Password',
    );
  }

  Widget _buildLogOutButton(BuildContext context) {
    return CustomButton(
      text: 'Log Out',
      onPressed: () => Navigator.of(context).pushReplacementNamed(
        AppRoutes.signInPage,
      ),
    );
  }
}
