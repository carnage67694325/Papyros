class Like {
  final String? id;
  final String? userName;
  final String? profileImage;
  final String? backGroungImage;

  Like({
    this.id,
    this.userName,
    this.profileImage,
    this.backGroungImage,
  });

  factory Like.fromJson(Map<String, dynamic> json) => Like(
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
