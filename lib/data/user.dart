class User {
  int id;
  String name;
  String email;
  DateTime birthDate;
  int scans;

  User(this.id, this.name, this.email, this.birthDate, this.scans);

  factory User.fromJson(Map<String, dynamic> json) {
    if (json['id'] == null) return null;
    return User(
      json['id'],
      json['name'],
      json['email'],
      json['birthDate'],
      json['scans'],
    );
  }

  static User vasco =
      User(1, 'vp', 'vasco@tourist.pt', DateTime(1998, 04, 25), 7328);
  static User bia =
      User(1, 'bp', 'beatriz@tourist.pt', DateTime(1998, 02, 02), 42);
}
