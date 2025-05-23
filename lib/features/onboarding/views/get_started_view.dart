import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nti_ecommerce/core/cache/cache_helper.dart';
import 'package:nti_ecommerce/core/cache/cache_keys.dart';
import 'package:nti_ecommerce/core/helper/my_logger.dart';
import 'package:nti_ecommerce/core/helper/nav_helper.dart';
import 'package:nti_ecommerce/core/translation/translation_keys.dart';
import 'package:nti_ecommerce/core/utils/app_assets.dart';
import 'package:nti_ecommerce/core/widgets/my_button.dart';
import 'package:nti_ecommerce/features/auth/views/login_view.dart';
import 'package:nti_ecommerce/features/auth/views/register_view.dart';
import 'package:nti_ecommerce/features/onboarding/views/widgets/my_outlined_button.dart';

import '../../../core/cache/cache_data.dart';
import '../../../core/helper/responsive.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_styles.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    CacheData.firstTime = false;
    CacheHelper.saveData(key: CacheKeys.firstTime, value: CacheData.firstTime);

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.getStartedBackground),
                fit: BoxFit.fill,
              ),
            ),
          ),
          // Gradient Overlay
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveHelper.w(context, width: 45),
              vertical: ResponsiveHelper.h(context, height: 35),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.black.withAlpha(5), AppColors.black],
                begin: Alignment.center,
                end: Alignment.bottomCenter,
              ),
            ),
            // Content
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  TranslationKeys.YouwantAuthentichereyougo.tr,
                  style: AppTextStyles.f34w600(
                    context,
                    color: AppColors.white,
                  ).copyWith(height: 1.1),

                  textAlign: TextAlign.center,
                ),
                SizedBox(height: ResponsiveHelper.h(context, height: 24)),
                Text(
                  TranslationKeys.Finditherebuyitnow.tr,
                  style: AppTextStyles.f14w400(
                    context,
                    color: AppColors.lightWhite,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: ResponsiveHelper.h(context, height: 24)),
                MyButton(
                  title: TranslationKeys.Login.tr,
                  onPressed: () {
                    NavHelper.push(() => LoginView());
                  },
                ),
                SizedBox(height: ResponsiveHelper.h(context, height: 15)),
                MyOutlinedButton(
                  title: TranslationKeys.Register.tr,
                  onPressed: () {
                    NavHelper.push(() => RegisterView());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
