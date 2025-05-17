import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:nti_ecommerce/core/translation/translation_helper.dart';
import 'package:nti_ecommerce/core/translation/translation_keys.dart';
import 'package:nti_ecommerce/features/profile/data/repo/user_repo.dart';
import 'package:nti_ecommerce/features/profile/manager/user_cubit/user_state.dart';

import '../../../auth/data/models/user_model.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitialState()) {
    updateNameController.text = userModel.name!;
    updatePhoneController.text = userModel.phone!;
  }
  static UserCubit get(context) => BlocProvider.of(context);

  UserModel userModel = UserRepo().userModel;

  TextEditingController updateNameController = TextEditingController();
  TextEditingController updatePhoneController = TextEditingController();
  GlobalKey<FormState> updateFormKey = GlobalKey<FormState>();
  bool isEnglish = true;

  XFile? imageFile;

  void getUserData() async {
    emit(UserLoadingState());
    var result = await UserRepo().getUserData();
    result.fold(
      (error) {
        emit(UserErrorState(error));
      },
      (userModel) {
        this.userModel = userModel;
        emit(UserSuccessState());
      },
    );
  }

  void updateUser() async {
    emit(UserUpdateLoadingState());
    Future.delayed(const Duration(seconds: 2), () async {
      if (updateFormKey.currentState!.validate()) {
        var result = await UserRepo().updateProfile(
          name: updateNameController.text,
          phone: updatePhoneController.text,
          imageFile: imageFile,
        );
        result.fold(
          (error) {
            emit(UserUpdateErrorState(error));
          },
          (message) async {
            getUserData();

            emit(UserUpdateSuccessState(message));
          },
        );
      } else {
        emit(UserUpdateErrorState(TranslationKeys.fillAllFields.tr));
      }
    });
  }

  void changeLanguage() async {
    isEnglish = !isEnglish;
    await TranslationHelper.changeLanguage(isEnglish);

    emit(UserLanguageState());
  }
}
