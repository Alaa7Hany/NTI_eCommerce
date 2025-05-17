import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:nti_ecommerce/core/helper/my_snackbar.dart';
import 'package:nti_ecommerce/core/helper/responsive.dart';
import 'package:nti_ecommerce/core/translation/translation_keys.dart';
import 'package:nti_ecommerce/core/utils/app_text_styles.dart';
import 'package:nti_ecommerce/core/widgets/my_button.dart';
import 'package:nti_ecommerce/core/widgets/my_text_field.dart';
import 'package:nti_ecommerce/features/auth/views/login_view.dart';
import '../../../core/helper/nav_helper.dart';
import '../../../core/utils/app_colors.dart';
import '../manager/register_cubit/register_cubit.dart';
import '../manager/register_cubit/register_state.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => RegisterCubit(),
        child: Builder(
          builder: (context) {
            var cubit = RegisterCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              body: Form(
                key: cubit.formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ResponsiveHelper.w(context, width: 30),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          TranslationKeys.Createanaccount.tr,
                          style: AppTextStyles.f36w700(
                            context,
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(
                          height: ResponsiveHelper.h(context, height: 45),
                        ),
                        MyTextField(
                          type: TextFieldType.name,
                          controller: cubit.nameController,
                        ),
                        SizedBox(
                          height: ResponsiveHelper.h(context, height: 10),
                        ),
                        MyTextField(
                          type: TextFieldType.phone,
                          controller: cubit.phoneController,
                        ),
                        SizedBox(
                          height: ResponsiveHelper.h(context, height: 10),
                        ),
                        MyTextField(
                          type: TextFieldType.email,
                          controller: cubit.emailController,
                        ),
                        SizedBox(
                          height: ResponsiveHelper.h(context, height: 10),
                        ),
                        BlocBuilder<RegisterCubit, RegisterState>(
                          buildWhen:
                              (previous, current) =>
                                  current is RegisterObsecureState,
                          builder: (context, state) {
                            return MyTextField(
                              type: TextFieldType.password,
                              controller: cubit.passwordController,
                              obsecure: cubit.passObsecure,
                              onSuffixTapped: () {
                                cubit.togglePassObsecure();
                              },
                            );
                          },
                        ),
                        SizedBox(
                          height: ResponsiveHelper.h(context, height: 10),
                        ),
                        BlocBuilder<RegisterCubit, RegisterState>(
                          buildWhen:
                              (previous, current) =>
                                  current is RegisterConfirmObsecureState,
                          builder: (context, state) {
                            return MyTextField(
                              type: TextFieldType.password,
                              controller: cubit.confirmPasswordController,
                              obsecure: cubit.confirmObsecure,
                              passController: cubit.passwordController,
                              onSuffixTapped: () {
                                cubit.toggleConfirmObsecure();
                              },
                            );
                          },
                        ),
                        SizedBox(
                          height: ResponsiveHelper.h(context, height: 20),
                        ),
                        RichText(
                          text: TextSpan(
                            text: TranslationKeys.Byclickingthe.tr,
                            style: AppTextStyles.f12w400(
                              context,
                              color: AppColors.darkGrey,
                            ), // base style
                            children: [
                              TextSpan(
                                text: TranslationKeys.Register.tr,
                                style: AppTextStyles.f12w400(
                                  context,
                                  color: AppColors.primary,
                                ),
                              ),
                              TextSpan(
                                text:
                                    TranslationKeys
                                        .buttonyouagreetothepublicoffer
                                        .tr,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: ResponsiveHelper.h(context, height: 25),
                        ),
                        BlocConsumer<RegisterCubit, RegisterState>(
                          listener: (context, state) {
                            if (state is RegisterError) {
                              MySnackbar.error(context, state.error);
                            } else if (state is RegisterSuccess) {
                              MySnackbar.success(context, state.message);
                              NavHelper.pushReplaceAll(() => LoginView());
                            }
                          },
                          builder: (context, state) {
                            return MyButton(
                              title: TranslationKeys.CreateAccount.tr,
                              isLoading: state is RegisterLoading,
                              onPressed: () {
                                cubit.onCreateAccountPressed();
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
