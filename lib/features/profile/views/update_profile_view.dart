import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nti_ecommerce/core/cache/cache_data.dart';
import 'package:nti_ecommerce/core/cache/cache_keys.dart';
import 'package:nti_ecommerce/core/helper/my_logger.dart';
import 'package:nti_ecommerce/core/helper/nav_helper.dart';
import 'package:nti_ecommerce/core/helper/responsive.dart';
import 'package:nti_ecommerce/core/translation/translation_keys.dart';
import 'package:nti_ecommerce/core/utils/app_assets.dart';
import 'package:nti_ecommerce/core/utils/app_text_styles.dart';
import 'package:nti_ecommerce/core/widgets/image_manager/image_manager_view.dart';
import 'package:nti_ecommerce/core/widgets/my_button.dart';
import 'package:nti_ecommerce/core/widgets/my_rotator.dart';
import 'package:nti_ecommerce/core/widgets/my_text_field.dart';
import 'package:nti_ecommerce/core/widgets/svg_wrapper.dart';
import 'package:nti_ecommerce/features/profile/manager/user_cubit/user_cubit.dart';
import 'package:nti_ecommerce/features/profile/views/widgets/profile_image_widget.dart';

import '../../../core/utils/app_colors.dart';
import '../manager/user_cubit/user_state.dart';

class UpdateProfileView extends StatelessWidget {
  const UpdateProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          TranslationKeys.Profile.tr,
          style: AppTextStyles.f18w600(context, color: AppColors.black),
        ),
        // Rotate the arrow in case of language change
        leading: InkWell(
          onTap: () {
            NavHelper.pop();
          },
          child: MyRotator(icon: AppAssets.arrowRightIcon),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveHelper.w(context, width: 20),
        ),
        child: Form(
          key: UserCubit.get(context).updateFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              CircleAvatar(
                radius: ResponsiveHelper.w(context, width: 50),
                child: ImageManagerView(
                  onPicked: (XFile imageFile) {
                    // TODO: pass the user image
                    UserCubit.get(context).updateUserImage(imageFile);
                  },
                  pickedBody: (XFile image) {
                    return ProfileImageWidget(
                      image: Image.file(
                        File(image.path),
                        fit: BoxFit.cover,
                        height: ResponsiveHelper.w(context, width: 100),
                        width: ResponsiveHelper.w(context, width: 100),
                      ),
                    );
                  },
                  unPickedBody: const ProfileImageWidget(image: null),
                ),
              ),
              SizedBox(height: ResponsiveHelper.h(context, height: 60)),
              MyTextField(
                type: TextFieldType.name,
                controller: UserCubit.get(context).updateEmailController,
              ),
              SizedBox(height: ResponsiveHelper.h(context, height: 10)),
              MyTextField(
                type: TextFieldType.phone,
                controller: UserCubit.get(context).updatePhoneController,
              ),
              SizedBox(height: ResponsiveHelper.h(context, height: 75)),
              BlocConsumer<UserCubit, UserState>(
                listener: (context, state) {
                  if (state is UserUpdateSuccessState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                        backgroundColor: AppColors.green,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return MyButton(
                    title: TranslationKeys.Save.tr,
                    isLoading: state is UserUpdateLoadingState,
                    onPressed: () {
                      if (UserCubit.get(
                        context,
                      ).updateFormKey.currentState!.validate()) {
                        UserCubit.get(context).updateUser();
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
