import 'package:papyros/features/authentication/sign_up/domain/entities/Sigup%20entity/sign_up_data_entity.dart';

/// userName : "test test2"
/// firstName : "test"
/// lastName : "test2"
/// email : "89192c7c7e@emailfoxi.pro"
/// password : "$2b$08$2eD32SloQ.MIzsr5HCITuubNKhhULUog2iBkm3yLso/CTCEIh5XoC"
/// phone : "01000020940"
/// status : "pending"
/// active : false
/// DOB : "2003-07-20T00:00:00.000Z"
/// otp : "207902"
/// otpExp : "2024-11-01T04:43:39.251Z"
/// gender : "female"
/// _id : "67245a239de9f57e74bfac9a"
/// createdAt : "2024-11-01T04:33:39.262Z"
/// updatedAt : "2024-11-01T04:33:39.262Z"
/// __v : 0

class UserModel {
  UserModel({
    this.userName,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.phone,
    this.status,
    this.active,
    this.dob,
    this.otp,
    this.otpExp,
    this.gender,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  UserModel.fromJson(dynamic json) {
    userName = json['userName'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    status = json['status'];
    active = json['active'];
    dob = json['DOB'];
    otp = json['otp'];
    otpExp = json['otpExp'];
    gender = json['gender'];
    id = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? userName;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? phone;
  String? status;
  bool? active;
  String? dob;
  String? otp;
  String? otpExp;
  String? gender;
  String? id;
  String? createdAt;
  String? updatedAt;
  num? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userName'] = userName;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['password'] = password;
    map['phone'] = phone;
    map['status'] = status;
    map['active'] = active;
    map['DOB'] = dob;
    map['otp'] = otp;
    map['otpExp'] = otpExp;
    map['gender'] = gender;
    map['_id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

  SignUpDataEntity toDataEntity() {
    return SignUpDataEntity(
      email: email,
      firstName: firstName,
      lastName: lastName,
      password: password,
      phone: phone,
      status: status,
      userName: userName,
      dob: dob,
      gender: gender,
    );
  }
}
