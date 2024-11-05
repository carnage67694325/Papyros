import 'package:papyros/features/authentication/sign_In/domain/entities/sigin_data_entity.dart';

class SiginModel extends SiginDataEntity {
  String? email;
  String? password;

  SiginModel({this.email, this.password})
      : super(emailEntity: email, passwordEntity: password!);

  factory SiginModel.fromJson(Map<String, dynamic> json) => SiginModel(
        email: json['email'] as String?,
        password: json['password'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}
