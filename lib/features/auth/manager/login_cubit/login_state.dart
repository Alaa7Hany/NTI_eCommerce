import 'package:nti_ecommerce/features/auth/data/models/user_model.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final UserModel userModel;
  LoginSuccess(this.userModel);
}

class LoginError extends LoginState {
  final String error;
  LoginError(this.error);
}

class LoginObsecureState extends LoginState {
  LoginObsecureState();
}
