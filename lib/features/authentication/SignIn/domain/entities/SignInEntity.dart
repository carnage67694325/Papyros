/// message : "loged in sucessfully"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NzI1Y2RjYzA1YTcxOTU4ZWIxYjlkNWMiLCJlbWFpbCI6Ijg5MTkyYzdjN2VAZW1haWxmb3hpLnBybyIsInVzZXJOYW1lIjoidGVzdCB0ZXN0MiIsImlhdCI6MTczMDUzMTA4NH0.77wJuPEqoUOaEDkrEAD8nLzt-EJLXJa9DU9xpdyWDwg"

class SignInEntity {
  SignInEntity({
      this.message, 
      this.token,});

  SignInEntity.fromJson(dynamic json) {
    message = json['message'];
    token = json['token'];
  }
  String? message;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['token'] = token;
    return map;
  }

}