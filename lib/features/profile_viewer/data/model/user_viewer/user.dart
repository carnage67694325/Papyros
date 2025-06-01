class User {
  String? id;
  String? userName;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? phone;
  String? status;
  bool? active;
  DateTime? dob;
  String? otp;
  DateTime? otpExp;
  String? gender;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? profileImage;
  String? bio;
  String? location;
  String? backGroungImage;
  String? backGroungimageId;
  List<dynamic>? followers;
  List<dynamic>? following;
  String? socketId;
  String? profileimageId;

  User({
    this.id,
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
    this.createdAt,
    this.updatedAt,
    this.v,
    this.profileImage,
    this.bio,
    this.location,
    this.backGroungImage,
    this.backGroungimageId,
    this.followers,
    this.following,
    this.socketId,
    this.profileimageId,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['_id'] as String?,
        userName: json['userName'] as String?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        email: json['email'] as String?,
        password: json['password'] as String?,
        phone: json['phone'] as String?,
        status: json['status'] as String?,
        active: json['active'] as bool?,
        dob: json['DOB'] == null ? null : DateTime.parse(json['DOB'] as String),
        otp: json['otp'] as String?,
        otpExp: json['otpExp'] == null
            ? null
            : DateTime.parse(json['otpExp'] as String),
        gender: json['gender'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
        profileImage: json['profileImage'] as String?,
        bio: json['bio'] as String?,
        location: json['location'] as String?,
        backGroungImage: json['backGroungImage'] as String?,
        backGroungimageId: json['backGroungimageId'] as String?,
        followers: json['followers'] as List<dynamic>?,
        following: json['following'] as List<dynamic>?,
        socketId: json['socketId'] as String?,
        profileimageId: json['profileimageId'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'userName': userName,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
        'phone': phone,
        'status': status,
        'active': active,
        'DOB': dob?.toIso8601String(),
        'otp': otp,
        'otpExp': otpExp?.toIso8601String(),
        'gender': gender,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'profileImage': profileImage,
        'bio': bio,
        'location': location,
        'backGroungImage': backGroungImage,
        'backGroungimageId': backGroungimageId,
        'followers': followers,
        'following': following,
        'socketId': socketId,
        'profileimageId': profileimageId,
      };
}
