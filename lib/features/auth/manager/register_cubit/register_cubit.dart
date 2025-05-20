import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:nti_ecommerce/core/translation/translation_keys.dart';
import 'package:nti_ecommerce/features/auth/data/repo/auth_repo.dart';

import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool passObsecure = true;
  bool confirmObsecure = true;

  void onCreateAccountPressed() async {
    emit(RegisterLoading());
    Future.delayed(const Duration(seconds: 2), () async {
      if (formKey.currentState!.validate()) {
        var result = await AuthRepo().register(
          name: nameController.text,
          email: emailController.text,
          imageFile: null, // TODO: implement image picker ????
          password: passwordController.text,
          phone: phoneController.text,
        );
        result.fold(
          (error) {
            emit(RegisterError(error));
          },
          (success) {
            emit(RegisterSuccess(success));
          },
        );
      } else {
        emit(RegisterError(TranslationKeys.fillAllFields.tr));
      }
    });
  }

  void togglePassObsecure() {
    passObsecure = !passObsecure;
    emit(RegisterObsecureState());
  }

  void toggleConfirmObsecure() {
    confirmObsecure = !confirmObsecure;
    emit(RegisterConfirmObsecureState());
  }
}
