import 'group.dart';

class Groups {
  String? msg;
  List<Group>? groups;

  Groups({this.msg, this.groups});

  factory Groups.fromJson(Map<String, dynamic> json) => Groups(
        msg: json['msg'] as String?,
        groups: (json['groups'] as List<dynamic>?)
            ?.map((e) => Group.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'msg': msg,
        'groups': groups?.map((e) => e.toJson()).toList(),
      };
}
