class Member {
  String? id;
  String? userName;
  String? profileImage;
  String? backGroungImage;

  Member({this.id, this.userName, this.profileImage, this.backGroungImage});

  factory Member.fromJson(Map<String, dynamic> json) => Member(
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
