/// userName : "test test2"
/// firstName : "test"
/// lastName : "test2"
/// email : "89192c7c7e@emailfoxi.pro"
/// password : "$2b$08$JU7pnet8lXHSg2juMGLe1.6pfeVakiTBSS0R8pvUK2lOvC/u9l6QS"
/// phone : "01000020940"
/// status : "pending"

class SignUpDataEntity {
  SignUpDataEntity(
      {this.userName,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.phone,
      this.status,
      this.gender,
      this.dob});

  String? userName;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? phone;
  String? status;
  String? gender;
  String? dob;
}
