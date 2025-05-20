import 'package:image_picker/image_picker.dart';

abstract class UserState {}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class UserSuccessState extends UserState {}

class UserErrorState extends UserState {
  final String error;
  UserErrorState(this.error);
}

class UserUpdateLoadingState extends UserState {}

class UserUpdateSuccessState extends UserState {
  final String message;
  UserUpdateSuccessState(this.message);
}

class UserUpdateErrorState extends UserState {
  final String error;
  UserUpdateErrorState(this.error);
}

class UserImageSuccessState extends UserState {
  final String imagePath;
  UserImageSuccessState(this.imagePath);
}

class UserLanguageState extends UserState {
  UserLanguageState();
}

class UserDeleteLoadingState extends UserState {}

class UserDeleteSuccessState extends UserState {
  final String message;
  UserDeleteSuccessState(this.message);
}

class UserDeleteErrorState extends UserState {
  final String error;
  UserDeleteErrorState(this.error);
}

class UserLogoutState extends UserState {
  final String message;
  UserLogoutState(this.message);
}
