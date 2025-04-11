import '../../domain/entities/user_profile_entity.dart';

class UserProfileModel extends UserProfileEntity {
  UserProfileModel({
    required String super.userName,
    required String super.firstName,
    required String super.lastName,
    required String super.email,
    required String super.phone,
    required String super.bio,
    required dynamic profileImage,
    required dynamic backgroundImage,
    required String super.location,
    required String super.dob,
    required String super.gender,
  }) : super(
          profileImage: profileImage,
          backgroundImage: backgroundImage,
        );

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      userName: json['userName'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      bio: json['bio'] ?? '',
      profileImage: json['profileImage'] ?? '',
      backgroundImage: json['backGroungImage'] ?? '',
      location: json['location'] ?? '',
      dob: json['DOB'] ?? '',
      gender: json['gender'] ?? '',
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
