import 'package:flutter/widgets.dart';

import '../../../../core/helper/responsive.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/svg_wrapper.dart';

class EmptyOrdersWidget extends StatelessWidget {
  const EmptyOrdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveHelper.w(context, width: 30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgWrapper(
              assetName: AppAssets.emptyOrders,
              height: ResponsiveHelper.h(context, height: 200),
              width: ResponsiveHelper.w(context, width: 200),
            ),
            SizedBox(height: ResponsiveHelper.h(context, height: 10)),
            Text(
              'You don\'t have any active orders at this time',
              style: AppTextStyles.f30w500(context, color: AppColors.primary),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
