/// userName : "test test2"
/// firstName : "test"
/// lastName : "test2"
/// email : "89192c7c7e@emailfoxi.pro"
/// password : "$2b$08$JU7pnet8lXHSg2juMGLe1.6pfeVakiTBSS0R8pvUK2lOvC/u9l6QS"
/// phone : "01000020940"
/// status : "pending"

class SignUpDataEntity {
  SignUpDataEntity(
      {this.userNameEntity,
      this.firstNameEntity,
      this.lastNameEntity,
      this.emailEntity,
      this.passwordEntity,
      this.phoneEntity,
      this.statusEntity,
      this.genderEntity,
      this.dobEntity});

  String? userNameEntity;
  String? firstNameEntity;
  String? lastNameEntity;
  String? emailEntity;
  String? passwordEntity;
  String? phoneEntity;
  String? statusEntity;
  String? genderEntity;
  String? dobEntity;
}
