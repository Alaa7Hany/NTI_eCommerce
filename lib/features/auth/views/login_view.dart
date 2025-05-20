import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:nti_ecommerce/core/helper/my_snackbar.dart';
import 'package:nti_ecommerce/core/helper/nav_helper.dart';
import 'package:nti_ecommerce/core/helper/responsive.dart';
import 'package:nti_ecommerce/core/translation/translation_keys.dart';
import 'package:nti_ecommerce/core/utils/app_text_styles.dart';
import 'package:nti_ecommerce/core/widgets/my_appbar.dart';
import 'package:nti_ecommerce/core/widgets/my_button.dart';
import 'package:nti_ecommerce/core/widgets/my_text_field.dart';
import 'package:nti_ecommerce/features/auth/manager/login_cubit/login_cubit.dart';
import 'package:nti_ecommerce/features/home/views/main_app_view.dart';
import 'package:nti_ecommerce/main.dart';

import '../../../core/utils/app_colors.dart';
import '../manager/login_cubit/login_state.dart';
import 'register_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => LoginCubit(),
        child: Builder(
          builder: (context) {
            var cubit = LoginCubit.get(context);
            return Scaffold(
              appBar: MyAppBar.appBar(),
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
                              MySnackbar.error(context, state.error);
                            } else if (state is LoginSuccess) {
                              NavHelper.pushReplaceAll(() => MainAppView());
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
                        SizedBox(
                          height: ResponsiveHelper.h(context, height: 20),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              TranslationKeys.DontHaveACoount.tr,
                              style: AppTextStyles.f14w600(
                                context,
                              ).copyWith(color: AppColors.grey),
                            ),
                            TextButton(
                              onPressed: () {
                                NavHelper.pushReplace(() => RegisterView());
                              },
                              style: ButtonStyle(
                                overlayColor: WidgetStateProperty.all(
                                  Colors.transparent,
                                ),
                              ),
                              child: Text(
                                TranslationKeys.Register.tr,
                                style: AppTextStyles.f14w600(
                                  context,
                                ).copyWith(color: AppColors.primary),
                              ),
                            ),
                          ],
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
