// Sample data models
class GroupModel {
  final String name;
  final int memberCount;
  final bool hasNewPosts;
  final int newPostsCount;
  final int mutualFriends;

  GroupModel({
    required this.name,
    required this.memberCount,
    this.hasNewPosts = false,
    this.newPostsCount = 0,
    this.mutualFriends = 0,
  });
}
