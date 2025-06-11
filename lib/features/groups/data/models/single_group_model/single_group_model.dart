import 'fullgroup.dart';

class SingleGroupModel {
  String? msg;
  Fullgroup? fullgroup;

  SingleGroupModel({this.msg, this.fullgroup});

  factory SingleGroupModel.fromJson(Map<String, dynamic> json) {
    return SingleGroupModel(
      msg: json['msg'] as String?,
      fullgroup: json['fullgroup'] == null
          ? null
          : Fullgroup.fromJson(json['fullgroup'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'msg': msg,
        'fullgroup': fullgroup?.toJson(),
      };
}
