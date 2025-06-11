class Admin {
  String? id;
  String? userName;
  String? profileImage;
  String? backGroungImage;

  Admin({this.id, this.userName, this.profileImage, this.backGroungImage});

  factory Admin.fromJson(Map<String, dynamic> json) => Admin(
        id: json['_id'] as String?,
        userName: json['userName'] as String?,
        profileImage: json['profileImage'] as String?,
        backGroungImage: json['backGroungImage'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'userName': userName,
        'profileImage': profileImage,
        'backGroungImage': backGroungImage,
      };
}
