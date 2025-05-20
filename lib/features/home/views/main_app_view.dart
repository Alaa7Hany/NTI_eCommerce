import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:nti_ecommerce/core/helper/responsive.dart';
import 'package:nti_ecommerce/core/utils/app_assets.dart';
import 'package:nti_ecommerce/core/utils/app_colors.dart';
import 'package:nti_ecommerce/core/utils/app_text_styles.dart';
import 'package:nti_ecommerce/core/widgets/svg_wrapper.dart';
import 'package:nti_ecommerce/features/home/manager/home_cubit/home_cubit.dart';
import 'package:nti_ecommerce/features/home/views/home_view.dart';
import 'package:nti_ecommerce/features/home/views/items_view.dart';
import 'package:nti_ecommerce/features/profile/views/profile_view.dart';

import '../../../core/translation/translation_keys.dart';
import '../manager/home_cubit/home_state.dart';

final List<Widget> pages = [HomeView(), ItemsView(), ProfileView()];

class MainAppView extends StatelessWidget {
  const MainAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              title:
                  cubit.currentPageIndex == 2
                      ? Text(
                        TranslationKeys.Profile.tr,
                        style: AppTextStyles.f18w600(
                          context,
                          color: AppColors.black,
                        ),
                      )
                      : SvgWrapper(
                        assetName: AppAssets.splash,
                        fit: BoxFit.scaleDown,
                        height: ResponsiveHelper.h(context, height: 40),
                      ),
            ),
            body: pages[cubit.currentPageIndex],
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: AppColors.scaffoldBackground,
              selectedItemColor: AppColors.primary,
              selectedLabelStyle: AppTextStyles.f12w500(
                context,
                color: AppColors.primary,
              ),
              unselectedLabelStyle: AppTextStyles.f12w400(
                context,
                color: AppColors.grey,
              ),
              // selectedIconTheme: IconThemeData(color: AppColors.primary),
              // unselectedIconTheme: IconThemeData(color: AppColors.grey),
              items: [
                BottomNavigationBarItem(
                  icon: SvgWrapper(
                    assetName: AppAssets.homeIcon,
                    color:
                        cubit.currentPageIndex == 0 ? AppColors.primary : null,
                  ),
                  label: TranslationKeys.Home.tr,
                ),
                BottomNavigationBarItem(
                  icon: SvgWrapper(
                    assetName: AppAssets.cartIcon,
                    color:
                        cubit.currentPageIndex == 1 ? AppColors.primary : null,
                  ),
                  label: TranslationKeys.Items.tr,
                ),
                BottomNavigationBarItem(
                  icon: SvgWrapper(
                    assetName: AppAssets.profileIcon,
                    color:
                        cubit.currentPageIndex == 2 ? AppColors.primary : null,
                  ),
                  label: TranslationKeys.Profile.tr,
                ),
              ],
              currentIndex: cubit.currentPageIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
            ),
          );
        },
      ),
    );
  }
}
