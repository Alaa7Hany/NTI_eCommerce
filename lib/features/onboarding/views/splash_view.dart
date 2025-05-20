import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nti_ecommerce/core/helper/my_logger.dart';
import 'package:nti_ecommerce/core/helper/nav_helper.dart';
import 'package:nti_ecommerce/core/widgets/svg_wrapper.dart';

import '../../../core/cache/cache_data.dart';
import '../../../core/cache/cache_helper.dart';
import '../../../core/cache/cache_keys.dart';
import '../../../core/utils/app_assets.dart';
import '../../auth/views/login_view.dart';
import '../../home/views/main_app_view.dart';
import '../../profile/manager/user_cubit/user_cubit.dart';
import 'onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () async {
      // CacheHelper.removeData(key: CacheKeys.firstTime);
      // CacheHelper.removeData(key: CacheKeys.loggedIn);
      CacheData.firstTime = CacheHelper.getData(key: CacheKeys.firstTime);
      CacheData.loggedIn = CacheHelper.getData(key: CacheKeys.loggedIn);
      CacheData.accessToken = CacheHelper.getData(key: CacheKeys.accessToken);
      CacheData.refreshToken = CacheHelper.getData(key: CacheKeys.refreshToken);

      MyLogger.cyan(
        'From Splash ------- > CacheData.firstTime: ${CacheData.firstTime}, CacheData.loggedIn: ${CacheData.loggedIn}',
      );
      MyLogger.black(
        'From Splash ------- > CacheData.accessToken: ${CacheData.accessToken}, CacheData.refreshToken: ${CacheData.refreshToken}',
      );
      if (CacheData.firstTime == null) {
        NavHelper.pushReplace(() => const OnBoardingView());
      } else if (CacheData.loggedIn == null) {
        NavHelper.pushReplace(() => const LoginView());
      } else {
        UserCubit.get(context).getUserData().then((bool result) {
          if (result) {
            // if succeeded to fetch user data then go home
            NavHelper.pushReplace(() => MainAppView());
          } else {
            // if failed for any reason then login
            NavHelper.pushReplace(() => LoginView());
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgWrapper(assetName: AppAssets.splash, fit: BoxFit.contain),
      ),
    );
  }
}
