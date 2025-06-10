import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/groups/data/data_source/groups_data_source.dart';
import 'package:papyros/features/groups/data/models/groups/groups.dart';
import 'package:papyros/features/groups/domain/repo/group_repo.dart';

class GroupsRepoImp implements GroupRepo {
  final GroupsDataSource groupsDataSource;

  GroupsRepoImp({required this.groupsDataSource});
  @override
  Future<Either<Failure, Groups>> getGroups({required String token}) async {
    try {
      final data = await postdau.getRecommendPosts(token: token);
      final List<PostsEntity> postsList = (data["data"] as List)
          .map((post) => PostModel.fromJson(post))
          .toList();

      return right(postsList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
