import '../../domain/entities/user_profile_entity.dart';

class UserProfileModel extends UserProfileEntity {
  UserProfileModel({
    super.userId,
    super.userName,
    super.firstName,
    super.lastName,
    super.email,
    super.phone,
    super.bio,
    super.profileImage,
    super.backgroundImage,
    super.location,
    super.dob,
    super.gender,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> user) {
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
