import '../../domain/entities/user_profile_entity.dart';

class UserProfileModel extends UserProfileEntity {
  UserProfileModel({
    required String userName,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String bio,
    required dynamic profileImage,
    required dynamic backgroundImage,
    required String location,
    required String dob,
    required String gender,
  }) : super(
          userName: userName,
          lastName: lastName,
          firstName: firstName,
          email: email,
          phone: phone,
          bio: bio,
          profileImage: profileImage,
          backgroundImage: backgroundImage,
          location: location,
          dob: dob,
          gender: gender,
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
