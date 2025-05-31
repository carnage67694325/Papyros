import 'dart:convert';
import 'package:papyros/features/search/domain/entity/user_entity.dart';

class User {
  String? profileImage;
  String? id;
  String? userName;
  String? firstName;
  String? lastName;
  String? backGroungImage;

  User({
    this.profileImage,
    this.id,
    this.userName,
    this.firstName,
    this.lastName,
    this.backGroungImage,
  });

  factory User.fromMap(Map<String, dynamic> data) => User(
        profileImage: data['profileImage'] as String?,
        id: data['_id'] as String?,
        userName: data['userName'] as String?,
        firstName: data['firstName'] as String?,
        lastName: data['lastName'] as String?,
        backGroungImage: data['backGroungImage'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'profileImage': profileImage,
        '_id': id,
        'userName': userName,
        'firstName': firstName,
        'lastName': lastName,
        'backGroungImage': backGroungImage,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [User].
  factory User.fromJson(String data) {
    return User.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [User] to a JSON string.
  String toJson() => json.encode(toMap());
}

extension UserMapper on User {
  UserEntity toEntity() => UserEntity(
        id: id,
        userName: userName,
        firstName: firstName,
        lastName: lastName,
        profileImage: profileImage,
        backGroungImage: backGroungImage,
      );
}
