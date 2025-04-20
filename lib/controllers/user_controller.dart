import 'dart:developer';

import 'package:collection/collection.dart';

import '../model/user.dart';

abstract class UserController {
  static final List<User> users = [];

  /// Try to add a user on the users list based on the arguments given
  ///
  /// If the user already exists, returns false, otherwise returns true
  static bool registerUser({required String email, required String password}) {
    /// If the user exists, return false
    if (checkIfUserExists(email: email) == null) return false;

    users.add(User(email, password));
    log('User with email $email added');
    return true;
  }

  /// Returns a user based on the given arguments
  ///
  /// If the user does not exists, returns null instead
  static User? login({required String email, required String password}) {
    User? existingUser = checkIfUserExists(email: email);

    if (existingUser == null) return null;

    if (existingUser.email.isEmpty && existingUser.password.isEmpty) {
      log('User with email $email not found');
      return null;
    }

    return existingUser;
  }

  static User? checkIfUserExists({required String email}) {
    return users.firstWhereOrNull((user) => user.email == email);
  }

  static bool validatePassword({
    required String email,
    required String password,
  }) {
    User? user = checkIfUserExists(email: email);

    if (user == null) return false;

    return (user.password == password);
  }
}
