class User {
  String _username;
  String _password;
  String _email;

  get username {
    return this._username;
  }

  set email(newEmail) {
    this._email = newEmail;
  }

  User(
    this._username,
    this._password,
  );
}
