import 'package:socialfy/core/utils/strings_manager.dart';
abstract class CustomValidation{
  static String? validateEmail(String email) {
    if (email.isEmpty) {
      return AppStrings.emailRequired;
    }
    else if (email[0]==' ') {
      return AppStrings.emailNotValid;
    }
    else if(email.endsWith(' '))
    {
      return AppStrings.emailNotValid;
    }
    final RegExp emailRegex = RegExp(
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
    if (!emailRegex.hasMatch(email)) {
      return AppStrings.emailNotValid;
    }
    return null;
  }
  static String? validateName(String name) {
    if (name.isEmpty) {
      return AppStrings.nameRequired;
    }
    else if (name[0]==' ') {
      return  AppStrings.nameNotValid;
    }
    else if(name.endsWith(' '))
    {
      return AppStrings.nameNotValid;
    }
    final RegExp nameRegex = RegExp(r'^[a-zA-Z ]+$');
    if (!nameRegex.hasMatch(name)) {
      return AppStrings.nameNotValid;
    }
    return null;
  }
  static String? validatePhoneNumber(String phoneNumber) {
    if (phoneNumber.isEmpty) {
      return AppStrings.phoneRequired;
    }
    else if (phoneNumber[0]==' ') {
      return AppStrings.phoneNotValid;
    }
    else if(phoneNumber.endsWith(' '))
    {
      return AppStrings.phoneNotValid;
    }
    else if(phoneNumber.contains(' '))
    {
      return AppStrings.phoneNotValid;
    }
    return null;
  }
  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return AppStrings.passwordRequired;
    }
    else if(password.length<6)
    {
      return AppStrings.passwordLength;
    }
    else {
      return null;
    }
  }
  static String? validateConfirmPassword(String password,String confirmPassword) {
    if (password.isEmpty) {
      return AppStrings.confirmPasswordRequired;
    }
    else if (password!= confirmPassword)
    {
      return AppStrings.passwordNotMatch;
    } else {
      return null;
    }
  }
}