import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:nti_ecommerce/core/helper/my_logger.dart';
import 'package:nti_ecommerce/core/translation/translation_keys.dart';
import 'package:nti_ecommerce/features/auth/manager/login_cubit/login_state.dart';

import '../../data/repo/auth_repo.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool obsecure = true;

  void login() async {
    emit(LoginLoading());
    Future.delayed(const Duration(seconds: 2), () async {
      if (formKey.currentState!.validate()) {
        var result = await AuthRepo().login(
          email: emailController.text,
          password: passwordController.text,
        );
        result.fold(
          (error) {
            emit(LoginError(error));
          },
          (userModel) {
            MyLogger.magenta(userModel.name!);
            emit(LoginSuccess(userModel));
          },
        );
      } else {
        emit(LoginError(TranslationKeys.fillAllFields.tr));
      }
    });
  }

  void toggleObsecure() {
    obsecure = !obsecure;
    emit(LoginObsecureState());
  }
}
