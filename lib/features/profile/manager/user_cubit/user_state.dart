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

class UserImageLoadingState extends UserState {}

class UserImageSuccessState extends UserState {
  final String imagePath;
  UserImageSuccessState(this.imagePath);
}

class UserImageErrorState extends UserState {
  final String error;
  UserImageErrorState(this.error);
}

class UserImagePickedState extends UserState {
  final XFile imageFile;
  UserImagePickedState(this.imageFile);
}

class UserLanguageState extends UserState {
  UserLanguageState();
}
