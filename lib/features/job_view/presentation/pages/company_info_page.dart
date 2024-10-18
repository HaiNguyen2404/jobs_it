import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_styles.dart';
import '../../../../app/widgets/company_info_job_list_item.dart';

class CompanyInfoPage extends StatefulWidget {
  const CompanyInfoPage({super.key});

  @override
  State<CompanyInfoPage> createState() => _CompanyInfoPageState();
}

class _CompanyInfoPageState extends State<CompanyInfoPage>
    with AutomaticKeepAliveClientMixin<CompanyInfoPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.only(left: 6),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Company Overview',
              style: AppStyles.bodyMediumBold14,
            ),
            const SizedBox(height: 12),
            const Text(
              '''We are a dynamic product company focused on creating innovative digital solutions that solve real-world problems.
        
        Our team is dedicated to developing high-quality products, from mobile apps to software platforms, that enhance user experiences and drive business growth.
        
        We prioritize creativity, user-centric design, and cutting-edge technology to deliver impactful results in a competitive market.''',
              overflow: TextOverflow.ellipsis,
              style: AppStyles.bodySmall11,
              maxLines: 13,
            ),
            const SizedBox(height: 24),
            const Text(
              'Company Location',
              style: AppStyles.bodyMediumBold14,
            ),
            const SizedBox(height: 12),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: AppColors.primary,
                ),
                SizedBox(width: 4),
                Text('12, Address 1, Ward, District'),
              ],
            ),
            const SizedBox(height: 40),
            _buildJobList(),
          ],
        ),
      ),
    );
  }

  Widget _buildJobList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Other Jobs',
          style: AppStyles.bodyMediumBold14,
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: 200,
          width: double.maxFinite,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const CompanyInfoJobListItem();
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 20);
            },
            itemCount: 4,
          ),
        ),
      ],
    );
  }
}
