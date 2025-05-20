import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nti_ecommerce/core/helper/responsive.dart';
import 'package:nti_ecommerce/core/translation/translation_keys.dart';
import 'package:nti_ecommerce/core/utils/app_assets.dart';
import 'package:nti_ecommerce/core/utils/app_colors.dart';
import 'package:nti_ecommerce/core/utils/app_text_styles.dart';
import 'package:nti_ecommerce/features/home/data/models/category_response_model.dart';

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({
    super.key,
    required this.categories,
    this.choosenIndex = -1,
    this.onCategoryPressed,
  });
  final List<CategoryModel> categories;
  final int choosenIndex;
  final void Function(int index)? onCategoryPressed;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: categories.length + 1,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return index == categories.length
            ? Container(
              margin: EdgeInsets.only(
                top: ResponsiveHelper.h(context, height: 20),
              ),
              child: Text(
                TranslationKeys.AndMore.tr,
                style: AppTextStyles.f15w400(context, color: AppColors.primary),
              ),
            )
            : InkWell(
              onTap: () {
                onCategoryPressed == null ? null : onCategoryPressed!(index);
              },
              child: Container(
                margin: EdgeInsetsDirectional.only(end: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration:
                          choosenIndex == index
                              ? BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: AppColors.primary,
                                ),
                                borderRadius: BorderRadius.circular(
                                  ResponsiveHelper.w(context, width: 30),
                                ),
                              )
                              : null,
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,

                        radius: ResponsiveHelper.w(context, width: 30),
                        child:
                            categories[index].imagePath != null
                                ? Image.network(
                                  categories[index].imagePath!,
                                  fit: BoxFit.cover,
                                )
                                : Image.asset(AppAssets.splash),
                      ),
                    ),
                    SizedBox(height: ResponsiveHelper.h(context, height: 5)),
                    Text(
                      categories[index].title ?? '',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.f10w400(
                        context,
                        color:
                            choosenIndex == index
                                ? AppColors.primary
                                : AppColors.darkBag,
                      ),
                    ),
                  ],
                ),
              ),
            );
      },
    );
  }
}
