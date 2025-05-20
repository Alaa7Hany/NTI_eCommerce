import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../core/helper/responsive.dart';
import '../../../core/translation/translation_keys.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_styles.dart';
import '../../../core/widgets/grid_of_products.dart';
import '../manager/categories_cubit/categories_cubit.dart';
import '../manager/categories_cubit/categories_state.dart';
import 'widgets/categories_row.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              TranslationKeys.AllFeatured.tr,
              style: AppTextStyles.f18w600(context, color: AppColors.black),
            ),
            SizedBox(height: ResponsiveHelper.h(context, height: 20)),
            BlocBuilder<CategoriesCubit, CategoriesState>(
              builder: (context, state) {
                if (state is CategoriesLoading) {
                  return const Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  );
                } else if (state is CategoriesLoaded) {
                  return SizedBox(
                    height: ResponsiveHelper.h(context, height: 100),
                    child: CategoriesRow(
                      categories: state.categories,
                      onCategoryPressed: (index) {
                        CategoriesCubit.get(context).changeCategory(index);
                      },
                      choosenIndex: CategoriesCubit.get(context).choosenIndex,
                      // choosenIndex: ,
                    ),
                  );
                } else {
                  return const Center(child: Text('No Categories Found'));
                }
              },
            ),
            SizedBox(height: ResponsiveHelper.h(context, height: 20)),
            BlocBuilder<CategoriesCubit, CategoriesState>(
              builder: (context, state) {
                if (state is CategoriesLoading) {
                  return const Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  );
                } else if (state is CategoriesLoaded) {
                  return GridOfProducts(
                    products:
                        state
                            .categories[CategoriesCubit.get(
                              context,
                            ).choosenIndex]
                            .products!,
                  );
                } else {
                  return const Center(child: Text('No Products Found'));
                }
              },
            ),
            SizedBox(height: ResponsiveHelper.h(context, height: 20)),
          ],
        ),
      ),
    );
  }
}
