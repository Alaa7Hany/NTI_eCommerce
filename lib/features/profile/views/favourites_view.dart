import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:nti_ecommerce/core/translation/translation_keys.dart';
import 'package:nti_ecommerce/core/utils/app_colors.dart';
import 'package:nti_ecommerce/core/widgets/grid_of_products.dart';
import 'package:nti_ecommerce/core/widgets/my_appbar.dart';

import '../manager/favourites_cubit/favourites_cubit.dart';
import '../manager/favourites_cubit/favourites_state.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavouritesCubit()..loadFavourites(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: MyAppBar.appBar(title: TranslationKeys.MyFavorites.tr),

            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: BlocBuilder<FavouritesCubit, FavouritesState>(
                  builder: (context, state) {
                    if (state is FavouritesLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      );
                    } else if (state is FavouritesError) {
                      return Center(child: Text(state.error));
                    } else if (state is FavouritesEmpty) {
                      return Center(
                        child: Text(TranslationKeys.NoFavouritesYet.tr),
                      );
                    } else if (state is FavouritesLoaded) {
                      return GridOfProducts(products: state.favourites);
                    }
                    return SizedBox(height: 20);
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
