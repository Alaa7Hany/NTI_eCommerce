import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nti_ecommerce/core/utils/app_assets.dart';
import 'package:nti_ecommerce/core/utils/app_colors.dart';
import 'package:nti_ecommerce/core/utils/app_text_styles.dart';
import 'package:nti_ecommerce/features/profile/views/profile_view.dart';

import '../../../core/translation/translation_keys.dart';

class MainAppView extends StatelessWidget {
  const MainAppView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isProfile = true;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title:
            isProfile
                ? Text(
                  TranslationKeys.Profile.tr,
                  style: AppTextStyles.f18w600(context, color: AppColors.black),
                )
                : Image.asset(AppAssets.splash),
      ),
      body: ProfileView(),
    );
  }
}
