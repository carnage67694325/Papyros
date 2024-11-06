import 'package:papyros/features/authentication/sign%20_in/domain/entities/sign_in_entity.dart';

class SigninModel extends SignInEntity {
  String? email;
  String? password;

  SigninModel({this.email, this.password})
      : super(emailEntity: email!, passwordEntity: password!);

  factory SigninModel.fromJson(Map<String, dynamic> json) => SigninModel(
        email: json['email'] as String?,
        password: json['password'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}
