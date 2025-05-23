// ignore_for_file: constant_identifier_names

import 'dart:ui';

import '../cache/cache_keys.dart';

abstract class TranslationKeys {
  static const Locale localeEN = Locale(CacheKeys.keyEN);
  static const Locale localeAR = Locale(CacheKeys.keyAR);
  static const String ChooseProducts = 'ChooseProducts';
  static const String MakePayment = 'Make Payment';
  static const String GetYourOrder = 'Get Your Order';
  static const String body =
      'Alot of talk, Alot of talk, Alot of talk, Alot of talk, Alot of talk, Alot of talk, Alot of talk, Alot of talk';
  static const String Prev = 'Prev';
  static const String Next = 'Next';
  static const String Skip = 'Skip';
  static const String GetStarted = 'Get Started';
  static const String Register = 'Register';
  static const String Login = 'Login';
  static const String Finditherebuyitnow = 'Find it here, buy it now!';
  static const String YouwantAuthentichereyougo =
      'You want Authentic, here you go!';
  static const String FullName = 'Full Name';
  static const String Email = 'Email';
  static const String Password = 'Password';
  static const String ConfirmPassword = 'Confirm Password';
  static const String Phone = 'Phone';
  static const String CreateAccount = 'Create Account';
  static const String Createanaccount = 'Create an\naccount';
  static const String WelcomeBack = 'Welcome\nBack!';
  static const String Byclickingthe = 'By clicking the ';
  static const String buttonyouagreetothepublicoffer =
      ' button, you agree to the public offer';

  static const String DontHaveACoount = 'Don\'t have an account?';
  static const String AlreadyHaveAnAccount = 'Already have an account?';

  ///////////////--Validations--//////////////////
  static const String NameRequired = 'Name is required';
  static const String NameLength = 'Name must be at least 3 characters long';
  static const String EmailRequired = 'Email is required';
  static const String EmailValid = 'Enter a valid email address';
  static const String PasswordRequired = 'Password is required';
  static const String PasswordLength =
      'Password must be at least 6 characters long';
  static const String ConfirmPasswordRequired = 'Confirm password is required';
  static const String PasswordNotMatch = 'Passwords do not match';
  static const String PhoneRequired = 'Phone number is required';
  static const String PhoneValid = 'Enter a valid 11-digit phone number';
  static const String fillAllFields = 'Please fill all fields';

  ///////////////////////////////////////////////

  ////////////----Profile----//////////////////////
  static const String Profile = 'Profile';
  static const String MyProfile = 'My Profile';
  static const String MyOrders = 'My Orders';
  static const String MyFavorites = 'My Favorites';
  static const String Settings = 'Settings';
  static const String LogOut = 'Log Out';
  static const String Home = 'Home';
  static const String Items = 'Items';
  static const String Save = 'Save';
  static const String Language = 'Language';
  static const String DeleteAccount = 'Delete Account';
  static const String NoFavouritesYet = 'No Favourites Yet';

  /////////////--Home--//////////////////////
  static const String SearchanyProduct = 'Search any Product..';
  static const String AllFeatured = 'All Featured';
  static const String Recommended = 'Recommended';
  static const String AndMore = 'And More !!';
  static const String AddToCart = 'Add To Cart';
  static const String Search = 'Search';
  static const String NoResultsFound = 'No Results Found';
  static const String ProductAddedToCart = 'Product Added To Cart Successfully';
}
