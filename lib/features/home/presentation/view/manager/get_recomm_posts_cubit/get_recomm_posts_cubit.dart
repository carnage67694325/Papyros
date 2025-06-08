import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:papyros/core/Prefernces/Shaerdperefeancses.dart';
import 'package:papyros/features/home/domain/entities/posts_entity.dart';
import 'package:papyros/features/home/domain/use_cases/get_recommand_posts_usecase.dart';

part 'get_recomm_posts_state.dart';

class GetRecommPostsCubit extends Cubit<GetRecommPostsState> {
  final GetRecommandPostsUsecase recommandPostsUsecase;
  GetRecommPostsCubit(this.recommandPostsUsecase)
      : super(GetRecommPostsInitial());
  Future<void> getRecommPosts() async {
    emit(GetRecommPostsLoading());
    String? token = await PrefasHandelr.getAuthToken();
    var response = await recommandPostsUsecase.call(token: token!);
    response.fold((failure) {
      return emit(GetRecommPostsFailure(errMessage: failure.errMessage));
    }, (List<PostsEntity> posts) {
      return emit(GetRecommPostsSuccess(posts: posts));
    });
  }
}
