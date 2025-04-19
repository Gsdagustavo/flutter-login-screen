import 'dart:developer';

import '../model/user.dart';

abstract class UserController {
  static final List<User> users = [];

  /// Try to add a user on the users list based on the arguments given
  ///
  /// If the user already exists, returns false, otherwise returns true
  bool registerUser({required String email, required String password}) {
    if (users.any((u) => u.email == email)) {
      log('user already exists');
      return false;
    }

    users.add(User(email, password));
    log('User with email $email added');
    return true;
  }

  /// Returns a user based on the given arguments
  ///
  /// If the user does not exists, returns null instead
  User? login({required String email, required String password}) {
    User? existingUser = users.firstWhere(
      (u) => u.email == email && u.password == password,
      orElse: () => User('', ''),
    );

    if (existingUser.email.isEmpty && existingUser.password.isEmpty) {
      log('User with email $email not found');
      return null;
    }

    return existingUser;
  }
}
