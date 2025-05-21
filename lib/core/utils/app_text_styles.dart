import 'package:flutter/material.dart';

import 'app_colors.dart';
import '../helper/responsive.dart';

abstract class AppTextStyles {
  static const String fontFamily = 'Montserrat';

  static TextStyle f10w400(
    BuildContext context, {
    Color color = AppColors.black,
  }) {
    return TextStyle(
      fontSize: ResponsiveHelper.sp(context, fontSize: 10),
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  static TextStyle f12w400(
    BuildContext context, {
    Color color = AppColors.black,
  }) {
    return TextStyle(
      fontSize: ResponsiveHelper.sp(context, fontSize: 12),
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  static TextStyle f12w500(
    BuildContext context, {
    Color color = AppColors.black,
  }) {
    return TextStyle(
      fontSize: ResponsiveHelper.sp(context, fontSize: 12),
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static TextStyle f12w600(
    BuildContext context, {
    Color color = AppColors.black,
  }) {
    return TextStyle(
      fontSize: ResponsiveHelper.sp(context, fontSize: 12),
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle f14w300(
    BuildContext context, {
    Color color = AppColors.black,
  }) {
    return TextStyle(
      fontSize: ResponsiveHelper.sp(context, fontSize: 14),
      fontWeight: FontWeight.w300,
      color: color,
    );
  }

  static TextStyle f14w400(
    BuildContext context, {
    Color color = AppColors.black,
  }) {
    return TextStyle(
      fontSize: ResponsiveHelper.sp(context, fontSize: 14),
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  static TextStyle f14w600(
    BuildContext context, {
    Color color = AppColors.black,
  }) {
    return TextStyle(
      fontSize: ResponsiveHelper.sp(context, fontSize: 14),
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle f15w400(
    BuildContext context, {
    Color color = AppColors.black,
  }) {
    return TextStyle(
      fontSize: ResponsiveHelper.sp(context, fontSize: 15),
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  static TextStyle f15w500(
    BuildContext context, {
    Color color = AppColors.black,
  }) {
    return TextStyle(
      fontSize: ResponsiveHelper.sp(context, fontSize: 15),
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static TextStyle f16w400(
    BuildContext context, {
    Color color = AppColors.black,
  }) {
    return TextStyle(
      fontSize: ResponsiveHelper.sp(context, fontSize: 16),
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  static TextStyle f16w500(
    BuildContext context, {
    Color color = AppColors.black,
  }) {
    return TextStyle(
      fontSize: ResponsiveHelper.sp(context, fontSize: 16),
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static TextStyle f16w600(
    BuildContext context, {
    Color color = AppColors.black,
  }) {
    return TextStyle(
      fontSize: ResponsiveHelper.sp(context, fontSize: 16),
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle f17w400(
    BuildContext context, {
    Color color = AppColors.black,
  }) {
    return TextStyle(
      fontSize: ResponsiveHelper.sp(context, fontSize: 17),
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  static TextStyle f17w500(
    BuildContext context, {
    Color color = AppColors.black,
  }) {
    return TextStyle(
      fontSize: ResponsiveHelper.sp(context, fontSize: 17),
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static TextStyle f18w500(
    BuildContext context, {
    Color color = AppColors.black,
  }) {
    return TextStyle(
      fontSize: ResponsiveHelper.sp(context, fontSize: 18),
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static TextStyle f18w600(
    BuildContext context, {
    Color color = AppColors.black,
  }) {
    return TextStyle(
      fontSize: ResponsiveHelper.sp(context, fontSize: 18),
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle f20w500(
    BuildContext context, {
    Color color = AppColors.black,
  }) {
    return TextStyle(
      fontSize: ResponsiveHelper.sp(context, fontSize: 20),
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static TextStyle f20w600(
    BuildContext context, {
    Color color = AppColors.black,
  }) {
    return TextStyle(
      fontSize: ResponsiveHelper.sp(context, fontSize: 20),
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle f20w700(
    BuildContext context, {
    Color color = AppColors.black,
  }) {
    return TextStyle(
      fontSize: ResponsiveHelper.sp(context, fontSize: 20),
      fontWeight: FontWeight.w700,
      color: color,
    );
  }

  static TextStyle f23w600(
    BuildContext context, {
    Color color = AppColors.black,
  }) {
    return TextStyle(
      fontSize: ResponsiveHelper.sp(context, fontSize: 23),
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle f24w400(
    BuildContext context, {
    Color color = AppColors.black,
  }) {
    return TextStyle(
      fontSize: ResponsiveHelper.sp(context, fontSize: 24),
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  static TextStyle f24w800(
    BuildContext context, {
    Color color = AppColors.black,
  }) {
    return TextStyle(
      fontSize: ResponsiveHelper.sp(context, fontSize: 24),
      fontWeight: FontWeight.w800,
      color: color,
    );
  }

  static TextStyle f30w500(
    BuildContext context, {
    Color color = AppColors.black,
  }) {
    return TextStyle(
      fontSize: ResponsiveHelper.sp(context, fontSize: 30),
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static TextStyle f34w600(
    BuildContext context, {
    Color color = AppColors.black,
  }) {
    return TextStyle(
      fontSize: ResponsiveHelper.sp(context, fontSize: 34),
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle f36w700(
    BuildContext context, {
    Color color = AppColors.black,
  }) {
    return TextStyle(
      fontSize: ResponsiveHelper.sp(context, fontSize: 36),
      fontWeight: FontWeight.w700,
      color: color,
    );
  }
}
