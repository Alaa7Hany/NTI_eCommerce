import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nti_ecommerce/core/cache/cache_helper.dart';
import 'package:nti_ecommerce/core/cache/cache_keys.dart';
import 'package:nti_ecommerce/core/translation/translation_helper.dart';
import 'package:nti_ecommerce/features/profile/manager/user_cubit/user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitialState());
  static UserCubit get(context) => BlocProvider.of(context);

  TextEditingController updateEmailController = TextEditingController();
  TextEditingController updatePhoneController = TextEditingController();
  GlobalKey<FormState> updateFormKey = GlobalKey<FormState>();
  bool isEnglish = true;
  void updateUser() {
    emit(UserUpdateLoadingState());
    // TODO: Simulate a network call
    Future.delayed(const Duration(seconds: 2), () {
      if (updateFormKey.currentState!.validate()) {
        // Simulate a successful update
        emit(UserUpdateSuccessState("User updated successfully"));
      } else {
        emit(UserUpdateErrorState("Invalid data"));
      }
    });
  }

  void updateUserImage(XFile imageFile) {
    emit(UserImageLoadingState());
    // Simulate a network call
    Future.delayed(const Duration(seconds: 2), () {
      emit(UserImageSuccessState(imageFile.path));
    });
  }

  void changeLanguage() async {
    isEnglish = !isEnglish;
    await TranslationHelper.changeLanguage(isEnglish);
    emit(UserLanguageState());
  }
}
