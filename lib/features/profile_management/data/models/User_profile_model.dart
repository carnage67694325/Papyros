import '../../domain/entities/user_profile_entity.dart';

class UserProfileModel extends UserProfileEntity {
  UserProfileModel({
    String? userId,
    String? userName,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? bio,
    String? profileImage,
    String? backgroundImage,
    String? location,
    String? dob,
    String? gender,
  }) : super(
          userId: userId,
          userName: userName,
          firstName: firstName,
          lastName: lastName,
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
    final user = json['user'] ?? {};

    return UserProfileModel(
      userId: user['userId'] ?? '',
      userName: user['userName'] ?? '',
      firstName: user['firstName'] ?? '',
      lastName: user['lastName'] ?? '',
      email: user['email'] ?? '',
      phone: user['phone'] ?? '',
      bio: user['bio'] ?? '',
      profileImage: user['profileImage'] ?? '',
      backgroundImage: user['backGroungImage'] ?? '',
      location: user['location'] ?? '',
      dob: user['DOB'] ?? '',
      gender: user['gender'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'userName': userName,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'bio': bio,
      'profileImage': profileImage,
      'backGroungImage': backgroundImage,
      'location': location,
      'DOB': dob,
      'gender': gender,
    };
  }
}
