import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nti_ecommerce/core/utils/app_colors.dart';
import 'package:nti_ecommerce/core/utils/app_text_styles.dart';
import 'package:nti_ecommerce/features/onboarding/views/splash_view.dart';

import 'core/cache/cache_data.dart';
import 'core/cache/cache_helper.dart';
import 'core/translation/translation_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await TranslationHelper.setLanguage();
  await TranslationHelper.changeLanguage(true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale(CacheData.lang!),
      translations: TranslationHelper(),

      title: 'eCommerce',
      theme: ThemeData(
        buttonTheme: const ButtonThemeData(splashColor: Colors.transparent),
        fontFamily: AppTextStyles.fontFamily,
        scaffoldBackgroundColor: AppColors.scaffoldBackground,
      ),
      home: SplashView(),
    );
  }
}
