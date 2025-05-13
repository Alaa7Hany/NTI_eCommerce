abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  //TODO: Stor the user model recived in this state from api
  final String message;
  LoginSuccess(this.message);
}

class LoginError extends LoginState {
  final String error;
  LoginError(this.error);
}

class LoginObsecureState extends LoginState {
  LoginObsecureState();
}
