import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nti_ecommerce/core/helper/responsive.dart';
import 'package:nti_ecommerce/core/translation/translation_keys.dart';
import 'package:nti_ecommerce/core/utils/app_assets.dart';
import 'package:nti_ecommerce/core/utils/app_text_styles.dart';
import 'package:nti_ecommerce/core/widgets/svg_wrapper.dart';

import '../helper/validator.dart';
import '../utils/app_colors.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.type,
    required this.controller,
    this.passController,
    this.obsecure = true,
    this.onSuffixTapped,
  });
  final TextFieldType type;
  final TextEditingController controller;
  final TextEditingController? passController;
  final bool obsecure;
  final void Function()? onSuffixTapped;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case TextFieldType.password:
        return _passwordField(
          context,
          passController == null
              ? Validator.password
              : (value) =>
                  Validator.confirmPassword(value, passController!.text),
        );
      case TextFieldType.email:
        return _emailField(context, Validator.email);
      case TextFieldType.phone:
        return _phoneField(context, Validator.phone);
      case TextFieldType.name:
        return _nameField(context, Validator.name);
    }
  }

  ///////////////////////--Decorations//////////////////////
  InputDecoration _inputDecoration(
    BuildContext context, {
    required String hint,
    required String icon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hint,

      hintStyle: AppTextStyles.f12w500(context, color: AppColors.darkGrey),
      errorStyle: AppTextStyles.f12w500(context, color: AppColors.red),
      filled: true,
      fillColor: AppColors.textFieldFilling,
      contentPadding: EdgeInsets.symmetric(
        vertical: ResponsiveHelper.h(context, height: 20),
        horizontal: ResponsiveHelper.w(context, width: 10),
      ),

      prefixIcon: SvgWrappe(assetName: icon, fit: BoxFit.scaleDown),
      suffixIcon: suffixIcon,
      border: _border(context, AppColors.grey),
      focusedErrorBorder: _border(context, AppColors.primary),
      disabledBorder: _border(context, AppColors.grey),
      focusedBorder: _border(context, AppColors.green),
      enabledBorder: _border(context, AppColors.grey),
      errorBorder: _border(context, AppColors.primary),
    );
  }

  TextStyle _textStyle(BuildContext context) {
    return AppTextStyles.f12w500(context, color: AppColors.black);
  }

  InputBorder _border(BuildContext context, Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(ResponsiveHelper.w(context, width: 10)),
      ),
      borderSide: BorderSide(color: color, width: 1),
    );
  }

  /////////////////////////--TextFields////////////////////////////////
  Widget _nameField(
    BuildContext context,
    String? Function(String?)? validator,
  ) {
    return TextFormField(
      controller: controller,
      style: _textStyle(context),
      validator: validator,

      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.name,
      decoration: _inputDecoration(
        context,
        hint: TranslationKeys.FullName.tr,
        icon: AppAssets.userIcon,
      ),
    );
  }

  Widget _emailField(
    BuildContext context,
    String? Function(String?)? validator,
  ) {
    return TextFormField(
      controller: controller,
      validator: validator,
      style: _textStyle(context),

      autovalidateMode: AutovalidateMode.onUserInteraction,

      keyboardType: TextInputType.emailAddress,
      decoration: _inputDecoration(
        context,
        hint: TranslationKeys.Email.tr,
        icon: AppAssets.emailIcon,
      ),
    );
  }

  Widget _phoneField(
    BuildContext context,
    String? Function(String?)? validator,
  ) {
    return TextFormField(
      controller: controller,
      validator: validator,
      style: _textStyle(context),

      autovalidateMode: AutovalidateMode.onUserInteraction,

      keyboardType: TextInputType.phone,
      decoration: _inputDecoration(
        context,
        hint: TranslationKeys.Phone.tr,
        icon: AppAssets.phoneIcon,
      ),
    );
  }

  Widget _passwordField(
    BuildContext context,
    String? Function(String?)? validator,
  ) {
    return TextFormField(
      controller: controller,
      validator: validator,
      style: _textStyle(context),

      obscureText: obsecure,
      autovalidateMode: AutovalidateMode.onUserInteraction,

      keyboardType: TextInputType.visiblePassword,
      decoration: _inputDecoration(
        context,
        hint: TranslationKeys.Password.tr,
        icon: AppAssets.lockIcon,
        suffixIcon: IconButton(
          onPressed: onSuffixTapped,
          icon: SvgWrappe(assetName: AppAssets.eyeIcon),
        ),
      ),
    );
  }
}

enum TextFieldType { password, email, phone, name }
