class Pengelola {
    final int? id;
    final String password;

    Pengelola({
      this.id,
      required this.password,
    });

    Map<String, dynamic> toMap() {
      return {
        'id': id,
        'password': password,
      };
    }

    static Pengelola fromMap(Map<String, dynamic> map) {
      return Pengelola(
        id: map['id'],
        password: map['password'],
      );
    }
}