import 'package:papyros/features/messaging/domain/entites/contact_entity.dart';

class ContactModel extends ContactEntity {
  @override
  String? id;
  String? userName;
  @override
  String? profileImage;

  ContactModel({this.id, this.userName, this.profileImage})
      : super(
          id: id ?? '',
          name: userName ?? '',
          profileImage: profileImage ?? '',
        );

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
