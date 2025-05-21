import 'package:flutter/material.dart';
import 'package:nti_ecommerce/core/helper/responsive.dart';
import 'package:nti_ecommerce/core/utils/app_text_styles.dart';
import 'package:nti_ecommerce/features/my_orders/data/models/oreders_response_model.dart';

import '../../../../core/utils/app_colors.dart';

class OrderDetailsTile extends StatelessWidget {
  const OrderDetailsTile({
    super.key,
    required this.orderItemModel,
    this.areWeInCart = false,
  });
  final OrderItemModel orderItemModel;
  final bool areWeInCart;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveHelper.w(context, width: 10),
          vertical: ResponsiveHelper.h(context, height: 10),
        ),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    orderItemModel.imagePath!,
                    width: ResponsiveHelper.w(context, width: 120),
                    height: ResponsiveHelper.h(context, height: 120),
                    fit: BoxFit.scaleDown,
                  ),
                ),
                SizedBox(width: ResponsiveHelper.w(context, width: 10)),
                Column(
                  spacing: ResponsiveHelper.h(context, height: 5),
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      orderItemModel.name!,
                      style: AppTextStyles.f14w600(context),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        Text(
                          '${orderItemModel.rating}',
                          style: AppTextStyles.f12w500(context),
                        ),
                        Icon(
                          Icons.star,
                          color: AppColors.yellow,
                          size: ResponsiveHelper.w(context, width: 20),
                        ),
                      ],
                    ),

                    areWeInCart
                        ? SizedBox()
                        : Text(
                          '${orderItemModel.quantity} items',
                          style: AppTextStyles.f12w500(context),
                        ),
                    Text(
                      '${orderItemModel.price} EGP',
                      style: AppTextStyles.f16w600(context),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: ResponsiveHelper.h(context, height: 10)),
            Divider(color: AppColors.lightLightGrey, thickness: 1),
            SizedBox(height: ResponsiveHelper.h(context, height: 10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Order (${orderItemModel.quantity}) :',
                  style: AppTextStyles.f12w500(context),
                ),
                Text(
                  '${orderItemModel.totalPrice} EGP',
                  style: AppTextStyles.f12w600(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
