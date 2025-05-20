import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/utils.dart';
import 'package:nti_ecommerce/core/helper/my_snackbar.dart';
import 'package:nti_ecommerce/core/helper/responsive.dart';
import 'package:nti_ecommerce/core/utils/app_text_styles.dart';
import 'package:nti_ecommerce/core/widgets/grid_of_products.dart';
import 'package:nti_ecommerce/core/widgets/my_appbar.dart';
import 'package:nti_ecommerce/core/widgets/search_field.dart';
import 'package:nti_ecommerce/features/home/manager/search_cubit/search_cubit.dart';

import '../../../core/translation/translation_keys.dart';
import '../../../core/utils/app_colors.dart';
import '../manager/search_cubit/search_state.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: Builder(
        builder: (context) {
          var cubit = SearchCubit.get(context);
          return Scaffold(
            appBar: MyAppBar.appBar(title: TranslationKeys.Search.tr),
            body: Padding(
              padding: EdgeInsets.all(ResponsiveHelper.w(context, width: 16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchField(
                    controller: cubit.searchController,
                    onChanged: (cubit.search),
                  ),
                  SizedBox(height: ResponsiveHelper.h(context, height: 17)),
                  BlocBuilder<SearchCubit, SearchState>(
                    builder: (context, state) {
                      return state is SearchSuccessState
                          ? Text(
                            '${state.searchResults.length} ${TranslationKeys.Items.tr}',
                            style: AppTextStyles.f18w600(
                              context,
                              color: AppColors.black,
                            ),
                          )
                          : const SizedBox();
                    },
                  ),
                  SizedBox(height: ResponsiveHelper.h(context, height: 17)),
                  Expanded(
                    child: SingleChildScrollView(
                      child: BlocBuilder<SearchCubit, SearchState>(
                        builder: (context, state) {
                          if (state is SearchLoadingState) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primary,
                              ),
                            );
                          } else if (state is SearchSuccessState) {
                            return GridOfProducts(
                              products: state.searchResults,
                            );
                          } else {
                            return Center(
                              child: Text(TranslationKeys.NoResultsFound.tr),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
