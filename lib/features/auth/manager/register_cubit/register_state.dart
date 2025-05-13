abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final String message;
  RegisterSuccess(this.message);
}

class RegisterError extends RegisterState {
  final String error;
  RegisterError(this.error);
}

class RegisterObsecureState extends RegisterState {
  RegisterObsecureState();
}

class RegisterConfirmObsecureState extends RegisterState {
  RegisterConfirmObsecureState();
}
