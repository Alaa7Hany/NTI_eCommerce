import 'package:flutter/material.dart';
import 'package:nti_ecommerce/core/helper/responsive.dart';
import 'package:nti_ecommerce/core/utils/app_assets.dart';
import 'package:nti_ecommerce/core/utils/app_colors.dart';
import 'package:nti_ecommerce/core/utils/app_text_styles.dart';
import 'package:nti_ecommerce/core/widgets/my_rotator.dart';
import 'package:nti_ecommerce/core/widgets/svg_wrapper.dart';

class OptionsRowWidget extends StatelessWidget {
  const OptionsRowWidget({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });
  final String icon;
  final String title;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: ResponsiveHelper.h(context, height: 35)),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onTap,
        child: Row(
          children: [
            SvgWrapper(assetName: icon),
            SizedBox(width: ResponsiveHelper.w(context, width: 15)),
            Text(
              title,
              style: AppTextStyles.f18w500(context, color: AppColors.black),
            ),
            Spacer(),
            MyRotator(icon: AppAssets.arrowRightIcon, isEn: true),
          ],
        ),
      ),
    );
  }
}
