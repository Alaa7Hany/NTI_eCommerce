import 'package:flutter/material.dart';
import 'package:nti_ecommerce/core/cubit/product_cubit/product_cubit.dart';

import '../../../../core/helper/responsive.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/data/models/product_model.dart';

class ProductPriceRow extends StatelessWidget {
  const ProductPriceRow({
    super.key,
    required this.cubit,
    required this.productModel,
  });
  final ProductModel productModel;
  final ProductCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${productModel.price! * cubit.amount} EGP',
          style: AppTextStyles.f20w600(context, color: AppColors.primary),
        ),
        Spacer(),
        Container(
          height: ResponsiveHelper.h(context, height: 25),
          width: ResponsiveHelper.w(context, width: 25),
          margin: EdgeInsetsDirectional.only(end: 10),
          decoration: BoxDecoration(
            color: cubit.amount == 1 ? AppColors.pink : AppColors.primary,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: IconButton(
              padding: EdgeInsets.zero,
              color: AppColors.white,
              onPressed: () {
                cubit.decreaseAmount();
              },
              icon: const Icon(Icons.remove),
            ),
          ),
        ),
        Text(
          cubit.amount.toString(),
          style: AppTextStyles.f24w400(context, color: AppColors.darkBrown),
        ),
        Container(
          height: ResponsiveHelper.h(context, height: 25),
          width: ResponsiveHelper.w(context, width: 25),
          margin: EdgeInsetsDirectional.only(start: 10),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            color: AppColors.white,
            onPressed: () {
              cubit.increaseAmount();
            },
            icon: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
