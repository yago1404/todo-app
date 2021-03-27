class User {
  String _username;
  String _password;
  String? _email;

  get username {
    return this._username;
  }

  get password {
    return this._password;
  }

  set email(newEmail) {
    this._email = newEmail;
  }

  User(
    this._username,
    this._password,
  );
}
