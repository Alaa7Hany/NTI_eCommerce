import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:nti_ecommerce/core/helper/my_snackbar.dart';
import 'package:nti_ecommerce/core/helper/responsive.dart';
import 'package:nti_ecommerce/core/translation/translation_keys.dart';
import 'package:nti_ecommerce/core/utils/app_colors.dart';
import 'package:nti_ecommerce/core/utils/app_text_styles.dart';
import 'package:nti_ecommerce/core/widgets/my_appbar.dart';
import 'package:nti_ecommerce/core/widgets/my_button.dart';
import 'package:nti_ecommerce/core/widgets/svg_wrapper.dart';
import 'package:nti_ecommerce/core/data/models/product_model.dart';
import 'package:nti_ecommerce/core/cubit/product_cubit/product_cubit.dart';
import 'package:nti_ecommerce/features/home/views/widgets/product_price_row.dart';

import '../../../core/helper/my_logger.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/cubit/product_cubit/product_state.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(),
      child: Builder(
        builder: (context) {
          var cubit = ProductCubit.get(context);
          cubit.setProductModel(productModel);
          MyLogger.magenta('called from Product View');
          return Scaffold(
            appBar: MyAppBar.appBar(
              title: productModel.name!,
              titleStyle: AppTextStyles.f18w600(
                context,
                color: AppColors.black,
              ),
            ),
            body: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(
                    ResponsiveHelper.w(context, width: 25),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          // color: AppColors.primary,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Stack(
                            children: [
                              Image.network(
                                productModel.imagePath!,
                                fit: BoxFit.contain,
                              ),
                              Positioned(
                                top: 10,
                                right: 10,
                                child: BlocConsumer<ProductCubit, ProductState>(
                                  listener: (context, state) {
                                    if (state is ProductAddedToFavorites) {
                                      MySnackbar.success(
                                        context,
                                        state.message,
                                      );
                                    } else if (state is ProductError) {
                                      MySnackbar.error(context, state.error);
                                    }
                                  },
                                  builder: (context, state) {
                                    return InkWell(
                                      onTap: () {
                                        if (productModel.isFavorite!) {
                                          cubit.removeFromFavorites();
                                        } else {
                                          cubit.addToFavorites();
                                        }
                                      },
                                      child: CircleAvatar(
                                        backgroundColor:
                                            productModel.isFavorite!
                                                ? AppColors.primary
                                                : AppColors.lightLightGrey,
                                        child:
                                            state is ProductFavouriteLoading
                                                ? CircularProgressIndicator(
                                                  color: AppColors.pink,
                                                )
                                                : SvgWrapper(
                                                  assetName:
                                                      AppAssets.favouriteIcon,
                                                  color: AppColors.white,
                                                ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: ResponsiveHelper.h(context, height: 30)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productModel.name!,
                            style: AppTextStyles.f20w600(
                              context,
                              color: AppColors.black,
                            ),
                          ),
                          SizedBox(
                            height: ResponsiveHelper.h(context, height: 18),
                          ),
                          Text(
                            productModel.description!,
                            style: AppTextStyles.f14w400(
                              context,
                              color: AppColors.black,
                            ),
                          ),
                          SizedBox(
                            height: ResponsiveHelper.h(context, height: 30),
                          ),
                          BlocBuilder<ProductCubit, ProductState>(
                            builder: (context, state) {
                              return ProductPriceRow(
                                cubit: cubit,
                                productModel: productModel,
                              );
                            },
                          ),
                          SizedBox(
                            height: ResponsiveHelper.h(context, height: 30),
                          ),
                          BlocConsumer<ProductCubit, ProductState>(
                            listener: (context, state) {
                              if (state is ProductAddedToCart) {
                                MySnackbar.success(
                                  context,
                                  'Product Added To catrt Successfully',
                                );
                              }
                            },
                            builder: (context, state) {
                              return MyButton(
                                isLoading: state is ProductAddedToCartLoading,
                                title: TranslationKeys.AddToCart.tr,
                                icon: AppAssets.cartIcon,
                                onPressed: () {
                                  cubit.addToCart();
                                },
                              );
                            },
                          ),
                          SizedBox(
                            height: ResponsiveHelper.h(context, height: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
