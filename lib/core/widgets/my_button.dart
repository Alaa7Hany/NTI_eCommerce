import 'package:flutter/material.dart';
import 'package:nti_ecommerce/core/helper/responsive.dart';
import 'package:nti_ecommerce/core/utils/app_colors.dart';
import 'package:nti_ecommerce/core/utils/app_text_styles.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.title,
    this.onPressed,
    this.textStyle,
    this.radius = 5,
    this.isLoading = false,
    this.color = AppColors.primary,
    this.textColor = AppColors.white,
    this.borderColor,
  });

  final String title;
  final void Function()? onPressed;
  final TextStyle? textStyle;
  final double radius;
  final bool isLoading;
  final Color color;
  final Color textColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: ResponsiveHelper.h(context, height: 55),
      child: ElevatedButton(
        onPressed: onPressed,

        style: ElevatedButton.styleFrom(
          backgroundColor: isLoading ? AppColors.grey : color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              ResponsiveHelper.w(context, width: radius),
            ),
          ),
          side:
              borderColor != null
                  ? BorderSide(color: borderColor!, width: 1)
                  : null,
        ),

        child:
            isLoading
                ? CircularProgressIndicator(
                  padding: EdgeInsets.all(10),
                  color: AppColors.primary,
                )
                : Text(
                  title,
                  style: (textStyle ?? AppTextStyles.f20w600(context)).copyWith(
                    color: textColor,
                  ),
                ),
      ),
    );
  }
}
