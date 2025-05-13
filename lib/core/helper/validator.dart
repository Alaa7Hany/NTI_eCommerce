import 'package:get/get.dart';
import '../translation/translation_keys.dart';

abstract class Validator {
  static String? name(String? value) {
    if (value == null || value.isEmpty) {
      return TranslationKeys.NameRequired.tr;
    }
    if (value.length < 3) {
      return TranslationKeys.NameLength.tr;
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return TranslationKeys.EmailRequired.tr;
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return TranslationKeys.EmailValid.tr;
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return TranslationKeys.PasswordRequired.tr;
    }
    if (value.length < 6) {
      return TranslationKeys.PasswordLength.tr;
    }
    return null;
  }

  static String? confirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return TranslationKeys.ConfirmPasswordRequired.tr;
    }
    if (value != password) {
      return TranslationKeys.PasswordNotMatch.tr;
    }
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return TranslationKeys.PhoneRequired.tr;
    }
    final phoneRegex = RegExp(r'^\d{11}$');
    if (!phoneRegex.hasMatch(value)) {
      return TranslationKeys.PhoneValid.tr;
    }
    return null;
  }
}
