import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:nti_ecommerce/core/utils/app_colors.dart';
import 'package:nti_ecommerce/core/utils/app_text_styles.dart';

import '../data/models/product_model.dart';
import '../helper/responsive.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: ResponsiveHelper.h(context, height: 200),
            child: Image.network(product.imagePath!, fit: BoxFit.fill),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: AppColors.white,
              padding: EdgeInsets.symmetric(
                horizontal: ResponsiveHelper.w(context, width: 10),
                vertical: ResponsiveHelper.h(context, height: 10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    product.name!,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.f16w500(
                      context,
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    product.description!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: AppTextStyles.f10w400(
                      context,
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    '${product.price!} EGP',
                    style: AppTextStyles.f12w500(
                      context,
                      color: AppColors.black,
                    ),
                  ),
                  RatingStars(
                    axis: Axis.horizontal,
                    value: product.rating!,
                    onValueChanged: (v) {},
                    starCount: 5,
                    starSize: ResponsiveHelper.w(context, width: 10),

                    maxValue: 5,
                    starSpacing: 2,
                    valueLabelVisibility: false,
                    maxValueVisibility: true,

                    starOffColor: const Color(0xffe7e8ea),
                    starColor: AppColors.yellow,
                    angle: 0,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: ResponsiveHelper.h(context, height: 10)),
        ],
      ),
    );
  }
}
