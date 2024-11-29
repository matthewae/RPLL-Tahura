class Pengguna {
  final String username;
  final String email;
  final String password;

  Pengguna({
    required this.username,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'password': password,
    };
  }

  static Pengguna fromMap(Map<String, dynamic> map) {
    return Pengguna(
      username: map['username'],
      email: map['email'],
      password: map['password'],
    );
  }
}
