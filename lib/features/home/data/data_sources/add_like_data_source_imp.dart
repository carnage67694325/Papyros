import 'package:papyros/core/endpoints/endpiont.dart';
import 'package:papyros/core/utils/api_service.dart';
import 'package:papyros/features/home/data/data_sources/add_like_data_source.dart';

class AddLikeImp extends AddLikeDataSource {
  final ApiService apiService;

  AddLikeImp({required this.apiService});

  @override
  Future<void> addLike({required String token, required String postId}) async {
    apiService.addLike(
        endpoint: Endpiont.addLikeEndpoint + postId, token: token);
  }
}
