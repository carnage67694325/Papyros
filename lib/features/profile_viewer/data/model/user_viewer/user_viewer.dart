import 'post.dart';
import 'user.dart';

class UserViewer {
  String? msg;
  User? user;
  List<Post>? posts;

  UserViewer({this.msg, this.user, this.posts});

  factory UserViewer.fromJson(Map<String, dynamic> json) => UserViewer(
        msg: json['msg'] as String?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        posts: (json['posts'] as List<dynamic>?)
            ?.map((e) => Post.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'msg': msg,
        'user': user?.toJson(),
        'posts': posts?.map((e) => e.toJson()).toList(),
      };
}
