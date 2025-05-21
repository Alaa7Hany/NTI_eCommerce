import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'package:nti_ecommerce/core/helper/nav_helper.dart';
import 'package:nti_ecommerce/core/helper/responsive.dart';
import 'package:nti_ecommerce/core/utils/app_assets.dart';
import 'package:nti_ecommerce/core/utils/app_colors.dart';
import 'package:nti_ecommerce/core/utils/app_text_styles.dart';
import 'package:nti_ecommerce/features/profile/manager/user_cubit/user_cubit.dart';
import 'package:nti_ecommerce/features/profile/views/favourites_view.dart';
import 'package:nti_ecommerce/features/profile/views/settings_view.dart';
import 'package:nti_ecommerce/features/profile/views/update_profile_view.dart';
import 'package:nti_ecommerce/features/profile/views/widgets/options_row_widget.dart';
import 'package:nti_ecommerce/features/profile/views/widgets/profile_image_widget.dart';

import '../../../core/helper/my_snackbar.dart';
import '../../../core/translation/translation_keys.dart';
import '../../../core/widgets/svg_wrapper.dart';
import '../../auth/views/login_view.dart';
import '../../my_orders/views/my_orders_view.dart';
import '../manager/user_cubit/user_state.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> options = [
      {
        'icon': AppAssets.profileIcon,
        'title': TranslationKeys.MyProfile.tr,
        'navTo': UpdateProfileView(),
      },
      {
        'icon': AppAssets.bagIcon,
        'title': TranslationKeys.MyOrders.tr,
        'navTo': MyOrdersView(),
      },
      {
        'icon': AppAssets.favouriteIcon,
        'title': TranslationKeys.MyFavorites.tr,
        'navTo': FavouritesView(),
      },
      {
        'icon': AppAssets.settingsIcon,
        'title': TranslationKeys.Settings.tr,
        'navTo': SettingsView(),
      },
    ];
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.w(context, width: 24),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfileImageWidget(
              image:
                  UserCubit.get(context).userModel.imagePath != null
                      ? Image.network(
                        UserCubit.get(context).userModel.imagePath!,
                        fit: BoxFit.cover,
                        height: ResponsiveHelper.w(context, width: 100),
                        width: ResponsiveHelper.w(context, width: 100),
                      )
                      : null,
            ),
            SizedBox(height: ResponsiveHelper.h(context, height: 20)),
            Text(
              UserCubit.get(context).userModel.name!,
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
            BlocConsumer<UserCubit, UserState>(
              listener: (context, state) {
                if (state is UserLogoutState) {
                  MySnackbar.success(context, state.message);
                  NavHelper.pushReplaceAll(() => LoginView());
                }
              },
              builder: (context, state) {
                return InkWell(
                  onTap: () {
                    UserCubit.get(context).logOut();
                  },
                  child: Row(
                    children: [
                      SvgWrapper(assetName: AppAssets.logoutIcon),
                      SizedBox(width: ResponsiveHelper.w(context, width: 15)),
                      Text(
                        TranslationKeys.LogOut.tr,
                        style: AppTextStyles.f18w500(
                          context,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
