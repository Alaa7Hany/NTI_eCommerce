class UserRepo {
  UserRepo._internal();

  static final UserRepo _instance = UserRepo._internal();

  factory UserRepo() {
    return _instance;
  }
}
