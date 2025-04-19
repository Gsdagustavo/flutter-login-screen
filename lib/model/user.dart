class User {
  String email;
  String password;

  User(this.email, this.password);

  @override
  String toString() {
    return 'User{email: $email, password: $password}';
  }
}