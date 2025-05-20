import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nti_ecommerce/core/utils/app_colors.dart';
import 'package:nti_ecommerce/core/utils/app_text_styles.dart';
import 'package:nti_ecommerce/features/home/manager/search_cubit/search_cubit.dart';

import '../translation/translation_keys.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.controller,
    this.onChanged,
    this.onTap,
    this.focusNode,
  });
  final TextEditingController controller;
  final Function(String)? onChanged;
  final Function()? onTap;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      enabled: true,
      onTap: onTap,
      controller: controller,
      onChanged: onChanged,
      style: AppTextStyles.f14w400(context, color: AppColors.black),
      decoration: InputDecoration(
        hintText: TranslationKeys.SearchanyProduct.tr,
        hintStyle: AppTextStyles.f14w400(context, color: AppColors.grey),
        prefixIcon: const Icon(Icons.search, color: AppColors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        filled: true,
        fillColor: AppColors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.transparent),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
      ),
    );
  }
}
