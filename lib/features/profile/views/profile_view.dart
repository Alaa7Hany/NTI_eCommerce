import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nti_ecommerce/core/helper/nav_helper.dart';
import 'package:nti_ecommerce/core/helper/responsive.dart';
import 'package:nti_ecommerce/core/utils/app_assets.dart';
import 'package:nti_ecommerce/core/utils/app_colors.dart';
import 'package:nti_ecommerce/core/utils/app_text_styles.dart';
import 'package:nti_ecommerce/features/profile/views/update_profile_view.dart';
import 'package:nti_ecommerce/features/profile/views/widgets/options_row_widget.dart';
import 'package:nti_ecommerce/features/profile/views/widgets/profile_image_widget.dart';

import '../../../core/translation/translation_keys.dart';
import '../../../core/widgets/svg_wrapper.dart';

List<Map<String, dynamic>> options = [
  {
    'icon': AppAssets.profileIcon,
    'title': TranslationKeys.MyProfile.tr,
    'navTo': UpdateProfileView(),
  },
  {
    'icon': AppAssets.bagIcon,
    'title': TranslationKeys.MyOrders.tr,
    'navTo': UpdateProfileView(),
  },
  {
    'icon': AppAssets.favouriteIcon,
    'title': TranslationKeys.MyFavorites.tr,
    'navTo': UpdateProfileView(),
  },
  {
    'icon': AppAssets.settingsIcon,
    'title': TranslationKeys.Settings.tr,
    'navTo': UpdateProfileView(),
  },
];

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.w(context, width: 24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // TODO: pass the user image
          ProfileImageWidget(),
          SizedBox(height: ResponsiveHelper.h(context, height: 20)),
          Text(
            // TODO: Replace with actual user name
            'Alaa Hany',
            style: AppTextStyles.f18w600(context, color: AppColors.primary),
          ),
          SizedBox(height: ResponsiveHelper.h(context, height: 50)),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: options.length,
            itemBuilder:
                (context, index) => OptionsRowWidget(
                  icon: options[index]['icon']!,
                  title: options[index]['title']!,
                  onTap: () {
                    NavHelper.push(() => options[index]['navTo']);
                  },
                ),
          ),
          SizedBox(height: ResponsiveHelper.h(context, height: 20)),
          Divider(
            color: AppColors.primary,
            thickness: 1,
            height: ResponsiveHelper.h(context, height: 20),
          ),
          SizedBox(height: ResponsiveHelper.h(context, height: 20)),
          InkWell(
            onTap: () {
              //TODO: Implement logout functionality
            },
            child: Row(
              children: [
                SvgWrapper(assetName: AppAssets.logoutIcon),
                SizedBox(width: ResponsiveHelper.w(context, width: 15)),
                Text(
                  TranslationKeys.LogOut.tr,
                  style: AppTextStyles.f18w500(context, color: AppColors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
