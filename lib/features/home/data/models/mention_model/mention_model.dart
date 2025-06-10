import 'datum.dart';

class MentionModel {
  String? message;
  List<Datum>? data;

  MentionModel({this.message, this.data});

  factory MentionModel.fromJson(Map<String, dynamic> json) => MentionModel(
        message: json['message'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
