import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_ecommerce/core/helper/my_logger.dart';
import 'package:nti_ecommerce/core/helper/responsive.dart';
import 'package:nti_ecommerce/core/translation/translation_keys.dart';
import 'package:nti_ecommerce/core/utils/app_colors.dart';
import 'package:nti_ecommerce/core/utils/app_text_styles.dart';
import 'package:nti_ecommerce/core/widgets/search_field.dart';
import 'package:nti_ecommerce/features/home/manager/categories_cubit/categories_cubit.dart';
import 'package:nti_ecommerce/features/home/manager/home_cubit/home_cubit.dart';
import 'package:nti_ecommerce/features/home/manager/sliders_cubit/sliders_cubit.dart';
import 'package:nti_ecommerce/features/home/views/widgets/my_slider.dart';

import '../manager/categories_cubit/categories_state.dart';
import '../manager/sliders_cubit/sliders_sate.dart';
import 'widgets/categories_row.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CategoriesCubit()..getCategories()),
        BlocProvider(create: (context) => SlidersCubit()..getSliders()),
        BlocProvider(create: (context) => HomeCubit()),
      ],
      child: Builder(
        builder: (context) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveHelper.w(context, width: 15),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchField(
                    controller: HomeCubit.get(context).searchController,
                    onChanged: (value) {
                      MyLogger.black(value);
                    },
                  ),
                  SizedBox(height: ResponsiveHelper.h(context, height: 15)),
                  Text(
                    TranslationKeys.AllFeatured,
                    style: AppTextStyles.f18w600(
                      context,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: ResponsiveHelper.h(context, height: 20)),
                  BlocBuilder<CategoriesCubit, CategoriesState>(
                    builder: (context, state) {
                      if (state is CategoriesLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is CategoriesLoaded) {
                        return SizedBox(
                          height: ResponsiveHelper.h(context, height: 100),
                          child: CategoriesRow(categories: state.categories),
                        );
                      } else {
                        return const Center(child: Text('No Categories Found'));
                      }
                    },
                  ),
                  BlocBuilder<SlidersCubit, SlidersState>(
                    builder: (context, state) {
                      if (state is SlidersLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is SlidersLoaded) {
                        return MySlider(
                          sliders: state.sliders,

                          onSliderChanged: (index) {
                            HomeCubit.get(context).onSliderChanged(index);
                          },
                        );
                      } else {
                        return const Center(child: Text('No Sliders Found'));
                      }
                    },
                  ),

                  SizedBox(height: ResponsiveHelper.h(context, height: 20)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
