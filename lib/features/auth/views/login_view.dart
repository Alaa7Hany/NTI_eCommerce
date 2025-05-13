import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:nti_ecommerce/core/helper/responsive.dart';
import 'package:nti_ecommerce/core/translation/translation_keys.dart';
import 'package:nti_ecommerce/core/utils/app_text_styles.dart';
import 'package:nti_ecommerce/core/widgets/my_button.dart';
import 'package:nti_ecommerce/core/widgets/my_text_field.dart';
import 'package:nti_ecommerce/features/auth/manager/login_cubit/login_cubit.dart';

import '../../../core/utils/app_colors.dart';
import '../manager/login_cubit/login_state.dart';

class LoginView extends StatelessWidget {
  //TODO: put const back
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => LoginCubit(),
        child: Builder(
          builder: (context) {
            var cubit = LoginCubit.get(context);
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
                          TranslationKeys.WelcomeBack.tr,
                          style: AppTextStyles.f36w700(
                            context,
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(
                          height: ResponsiveHelper.h(context, height: 45),
                        ),
                        MyTextField(
                          type: TextFieldType.email,
                          controller: cubit.emailController,
                        ),
                        SizedBox(
                          height: ResponsiveHelper.h(context, height: 22),
                        ),
                        BlocBuilder<LoginCubit, LoginState>(
                          buildWhen:
                              (previous, current) =>
                                  current is LoginObsecureState,
                          builder: (context, state) {
                            return MyTextField(
                              type: TextFieldType.password,
                              controller: cubit.passwordController,
                              obsecure: cubit.obsecure,
                              onSuffixTapped: () {
                                cubit.toggleObsecure();
                              },
                            );
                          },
                        ),
                        SizedBox(
                          height: ResponsiveHelper.h(context, height: 55),
                        ),
                        BlocConsumer<LoginCubit, LoginState>(
                          listener: (context, state) {
                            if (state is LoginError) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(state.error),
                                  backgroundColor: AppColors.primary,
                                ),
                              );
                            } else if (state is LoginSuccess) {
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
                              title: TranslationKeys.Login.tr,
                              isLoading: state is LoginLoading,
                              onPressed: () {
                                cubit.login();
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
