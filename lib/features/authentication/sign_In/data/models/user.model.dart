class User {
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? dob;
  String? gender;
  String? password;

  User({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.dob,
    this.gender,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
        dob: json['DOB'] as String?,
        gender: json['gender'] as String?,
        password: json['password'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'phone': phone,
        'DOB': dob,
        'gender': gender,
        'password': password,
      };
}
