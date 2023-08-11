class User {
  late final int id;
  late final String email;
  late final String firstname;
  late final String lastname;
  late final String avatar;

  User(this.id, this.email, this.firstname, this.lastname, this.avatar);
  User.empty() {
    id = 0;
    email = "";
    firstname = "";
    lastname = "";
    avatar = "";
  }

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        email = json['email'],
        firstname = json['first_name'],
        lastname = json['last_name'],
        avatar = json['avatar'];

  User.fromMap(Map map)
      : id = map["id"],
        email = map["email"],
        firstname = map["firstname"],
        lastname = map["lastname"],
        avatar = map["avatar"];

  Map toMap() {
    return {
      "id": id,
      "email": email,
      "firstname": firstname,
      "lastname": lastname,
      "avatar": avatar,
    };
  }
}
