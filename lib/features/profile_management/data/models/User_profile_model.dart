import '../../domain/entities/user_profile_entity.dart';

class UserProfileModel extends UserProfileEntity {
  UserProfileModel({
    required String userName,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String bio,
    required String profileImage,
    required String backgroundImage,
    required String location,
  }) : super(
          userName: userName,
          firstName: firstName,
          lastName: lastName,
          email: email,
          phone: phone,
          bio: bio,
          profileImage: profileImage,
          backgroundImage: backgroundImage,
          location: location,
        );

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      userName: json['userName'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phone: json['phone'],
      bio: json['bio'],
      profileImage: json['profileImage'],
      backgroundImage: json['backGroungImage'],
      location: json['location'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'bio': bio,
      'profileImage': profileImage,
      'backGroungImage': backgroundImage,
      'location': location,
    };
  }
}
