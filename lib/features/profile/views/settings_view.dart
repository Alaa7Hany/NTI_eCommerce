import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:nti_ecommerce/core/helper/nav_helper.dart';
import 'package:nti_ecommerce/core/helper/responsive.dart';
import 'package:nti_ecommerce/core/utils/app_colors.dart';
import 'package:nti_ecommerce/core/utils/app_text_styles.dart';

import 'package:nti_ecommerce/core/widgets/my_appbar.dart';
import 'package:nti_ecommerce/features/home/views/main_app_view.dart';
import 'package:nti_ecommerce/features/profile/manager/user_cubit/user_cubit.dart';
import 'package:nti_ecommerce/features/profile/views/profile_view.dart';

import '../../../core/translation/translation_keys.dart';
import '../manager/user_cubit/user_state.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.appBar(title: TranslationKeys.Settings.tr),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveHelper.w(context, width: 25),
          vertical: ResponsiveHelper.h(context, height: 30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              TranslationKeys.Language.tr,
              style: AppTextStyles.f18w500(context, color: AppColors.black),
            ),
            BlocConsumer<UserCubit, UserState>(
              listener: (context, state) {
                if (state is UserLanguageState) {
                  NavHelper.pushReplaceAll(() => MainAppView());
                }
              },
              builder: (context, state) {
                var cubit = UserCubit.get(context);
                return InkWell(
                  onTap: () => cubit.changeLanguage(),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: ResponsiveHelper.w(context, width: 10),
                      vertical: ResponsiveHelper.h(context, height: 5),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: LinearGradient(
                        colors:
                            cubit.isEnglish
                                ? [AppColors.pink, AppColors.primary]
                                : [AppColors.primary, AppColors.pink],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        stops: [0.5, 0.5], // 50% each
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          cubit.isEnglish ? 'AR' : 'EN',
                          textAlign: TextAlign.start,
                          style: AppTextStyles.f20w500(
                            context,
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(width: ResponsiveHelper.w(context, width: 15)),
                        Text(
                          cubit.isEnglish ? 'EN' : 'AR',
                          textAlign: TextAlign.end,
                          style: AppTextStyles.f20w500(
                            context,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
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
