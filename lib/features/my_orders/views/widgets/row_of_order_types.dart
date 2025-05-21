import 'package:flutter/widgets.dart';

import '../../../../core/helper/responsive.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../manager/my_orders_cubit/my_orders_cubit.dart';

class RowOfOrderTypes extends StatelessWidget {
  const RowOfOrderTypes({super.key, required this.cubit});
  final MyOrdersCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      spacing: ResponsiveHelper.w(context, width: 3),
      children: [
        ...MyOrdersViewType.values.map((element) {
          final bool isSelected = element == cubit.orderType;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                cubit.pageController.animateToPage(
                  MyOrdersViewType.values.indexOf(element),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveHelper.w(context, width: 8),
                  vertical: ResponsiveHelper.h(context, height: 4),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    ResponsiveHelper.w(context, width: 15),
                  ),
                  color: isSelected ? AppColors.primary : AppColors.pink,
                ),
                child: Text(
                  getTitle(element),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style:
                      isSelected
                          ? AppTextStyles.f15w500(
                            context,
                            color: AppColors.white,
                          )
                          : AppTextStyles.f15w400(
                            context,
                            color: AppColors.primary,
                          ),
                ),
              ),
            ),
          );
        }),
      ],
    );
  }

  String getTitle(MyOrdersViewType type) {
    switch (type) {
      case MyOrdersViewType.active:
        return 'Active';
      case MyOrdersViewType.completed:
        return 'Completed';
      case MyOrdersViewType.cancelled:
        return 'Canceled';
    }
  }
}
