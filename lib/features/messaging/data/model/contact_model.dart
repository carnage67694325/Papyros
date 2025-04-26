class ContactModel {
  String? id;
  String? userName;
  String? profileImage;

  ContactModel({this.id, this.userName, this.profileImage});

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
        id: json['_id'] as String?,
        userName: json['userName'] as String?,
        profileImage: json['profileImage'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'userName': userName,
        'profileImage': profileImage,
      };
}
