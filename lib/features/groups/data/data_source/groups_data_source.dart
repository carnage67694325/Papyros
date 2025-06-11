import 'package:papyros/features/groups/data/models/groups/group.dart';

abstract class GroupsDataSource {
  Future<Map<String, dynamic>> getGroups({required String token});
  Future<Map<String, dynamic>> getSingleGroup(
      {required String token, required String groupId});

  Future<void> addGroup({required String token, required Group group});
}
