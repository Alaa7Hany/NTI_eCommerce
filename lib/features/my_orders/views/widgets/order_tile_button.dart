import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/helper/responsive.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

class OrderTileButton extends StatelessWidget {
  const OrderTileButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
  });
  final String title;
  final void Function() onPressed;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ResponsiveHelper.h(context, height: 35),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isLoading ? AppColors.grey : AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(
            vertical: ResponsiveHelper.h(context, height: 1),
            horizontal: ResponsiveHelper.w(context, width: 5),
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child:
            isLoading
                ? Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                    padding: EdgeInsets.all(3),
                  ),
                )
                : Text(
                  title,
                  style: AppTextStyles.f12w600(context, color: AppColors.white),
                ),
      ),
    );
  }
}
