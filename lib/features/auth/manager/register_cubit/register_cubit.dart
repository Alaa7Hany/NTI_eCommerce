import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  void register() {
    emit(RegisterLoading());
    Future.delayed(const Duration(seconds: 2), () {
      if (formKey.currentState!.validate()) {
        //TODO: Call the Register API and handle the response
        emit(RegisterSuccess("Register successful"));
      } else {
        emit(RegisterError("Invalid credentials"));
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
