import 'data_entity.dart';

/// message : "sucess"
/// error : "error"
/// data : {"userName":"test test2","firstName":"test","lastName":"test2","email":"89192c7c7e@emailfoxi.pro","password":"$2b$08$JU7pnet8lXHSg2juMGLe1.6pfeVakiTBSS0R8pvUK2lOvC/u9l6QS","phone":"01000020940","status":"pending"}

class SignupEntity {
  SignupEntity({
    this.message,
    this.error,
    this.data,
  });

  String? message;
  String? error;
  SignUpDataEntity? data;
}
