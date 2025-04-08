class CreatedBy {
  CreatedBy({
    this.id,
    this.userName,
    this.profileImage,
    this.backGroungImage,
  });

  CreatedBy.fromJson(dynamic json) {
    id = json['_id'];
    userName = json['userName'];
    profileImage = json['profileImage'];
    backGroungImage = json['backGroungImage'];
  }

  String? id;
  String? userName;
  String? profileImage;
  String? backGroungImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['userName'] = userName;
    map['profileImage'] = profileImage;
    map['backGroungImage'] = backGroungImage;
    return map;
  }
}
