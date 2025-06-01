import 'dart:convert';

import 'user.dart';

class SearchModel {
  String? message;
  List<User>? user;

  SearchModel({this.message, this.user});

  factory SearchModel.fromMap(Map<String, dynamic> data) => SearchModel(
        message: data['message'] as String?,
        user: (data['user'] as List<dynamic>?)
            ?.map((e) => User.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'message': message,
        'user': user?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SearchModel].
  factory SearchModel.fromJson(String data) {
    return SearchModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SearchModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
