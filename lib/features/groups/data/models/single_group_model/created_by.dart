class CreatedBy {
  String? id;
  String? userName;
  String? profileImage;
  String? backGroungImage;

  CreatedBy({
    this.id,
    this.userName,
    this.profileImage,
    this.backGroungImage,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
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
