class User {
  User({
    this.name,
    this.lastname,
    this.phone,
    this.dateofBirth,
    this.email,
    this.age,
    this.gender,
  });

  String? name;
  String? lastname;
  String? email;
  int? phone;
  String? dateofBirth;
  int? age;
  String? gender;

  factory User.fromMap(Map<String, dynamic> json) => User(
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
        phone: json["phone"],
        dateofBirth: json["dateofBirth"],
        age: json["age"],
        gender: json["gender"],
      );

  Map<String, dynamic> toMap() => {
        "name": "$name",
        "lastname": "$lastname",
        "phone": "$phone",
        "email": "$email",
        "dateofBirth": "$dateofBirth",
        "age": "$age",
        "gender": "$gender",
      };
}
