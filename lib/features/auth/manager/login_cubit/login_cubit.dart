import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_ecommerce/features/auth/manager/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool obsecure = true;

  void login() {
    emit(LoginLoading());
    Future.delayed(const Duration(seconds: 2), () {
      if (formKey.currentState!.validate()) {
        //TODO: Call the login API and handle the response
        emit(LoginSuccess("Login successful"));
      } else {
        emit(LoginError("Invalid credentials"));
      }
    });
  }

  void toggleObsecure() {
    obsecure = !obsecure;
    emit(LoginObsecureState());
  }
}
