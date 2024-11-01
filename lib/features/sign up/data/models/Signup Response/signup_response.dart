import 'package:papyros/features/sign%20up/domain/entities/Sigup%20entity/SignupEntity.dart';

import 'data_model.dart';

/// message : "sucess"
/// error : "error"
/// data : {"userName":"test test2","firstName":"test","lastName":"test2","email":"89192c7c7e@emailfoxi.pro","password":"$2b$08$2eD32SloQ.MIzsr5HCITuubNKhhULUog2iBkm3yLso/CTCEIh5XoC","phone":"01000020940","status":"pending","active":false,"DOB":"2003-07-20T00:00:00.000Z","otp":"207902","otpExp":"2024-11-01T04:43:39.251Z","gender":"female","_id":"67245a239de9f57e74bfac9a","createdAt":"2024-11-01T04:33:39.262Z","updatedAt":"2024-11-01T04:33:39.262Z","__v":0}

class SignupResponse {
  SignupResponse({
    this.message,
    this.error,
    this.data,
  });

  SignupResponse.fromJson(dynamic json) {
    message = json['message'];
    error = json['error'];
    data = json['data'] != null ? DataModel.fromJson(json['data']) : null;
  }
  String? message;
  String? error;
  DataModel? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['error'] = error;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

  SignupEntity toSignupEntity() {
    return SignupEntity(
      data: data?.toDataEntity(),
      error: error,
      message: message,
    );
  }
}
