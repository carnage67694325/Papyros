import 'package:papyros/features/authentication/sign_In/data/models/sigin.model.dart';

import '../../domain/entities/SignInEntity.dart';

class SignInResponse {
  SignInResponse({
    this.message,
    this.statusMsg,
    this.user,
    this.token,
  });

  SignInResponse.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? SiginModel.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  String? statusMsg;
  SiginModel? user;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

  SignInEntity toSignInEntity() {
    return SignInEntity(
      message: message,
      token: token,
    );
  }
}
