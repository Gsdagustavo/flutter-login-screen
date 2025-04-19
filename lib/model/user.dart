class User {
  String email;
  String username;
  String password;

  User(this.email, this.username, this.password);

  @override
  String toString() {
    return 'User{email: $email, username: $username, password: $password}';
  }
}